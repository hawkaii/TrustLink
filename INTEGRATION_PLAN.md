# TrustLink Backend ↔ Frontend Integration Plan

**Goal:** Host the Go backend on an Ubuntu VM, connect the Flutter frontend, and enable login, posting, and viewing posts.

**Decisions made:**
- Backend hosted on Ubuntu VM using Docker Compose.
- Public VM IP over HTTP for now (no HTTPS/domain yet).
- Media storage: **Google Cloud Storage (GCS)** via backend-signed upload URLs.
- Auth: existing **Firebase Auth** (trustlink-1bae8 project).
- Feed: backend will JOIN user/profile data to enrich each post.

---

## Phase 1: Backend Changes

### 1.1 Replace S3 presign with GCS presign
- Add `cloud.google.com/go/storage` dependency.
- Create `internal/storage/gcs.go` with `PresignPutObject(bucket, object, contentType, expiry)` returning `putUrl` + `publicUrl`.
- Update `internal/handler/upload.go` to use GCS when `GCS_BUCKET` env var is set.
- Remove or keep S3 as fallback; prefer GCS-only to reduce dead code.

### 1.2 Enrich `/feed` with author info
- Update `PostRepo.ListFeed` to JOIN `users` and `profiles` tables.
- Each feed item returns:
  - `id`, `content`, `mediaUrl`, `createdAt`, `updatedAt`
  - `authorId`
  - `authorDisplayName`
  - `authorAvatarUrl`
- Update `openapi.yaml` to reflect the new fields.

### 1.3 CORS
- Update `internal/middleware/cors.go` to:
  - Allow `Authorization` header.
  - Allow the VM public IP origin for HTTP testing (`http://<VM_IP>:8080`).

### 1.4 Migrations
- Verify `0004_posts_media.sql` adds `media_url` to `posts`.
- Ensure `cmd/migrate` runs migrations in order on deploy.

---

## Phase 2: VM Deployment

### 2.1 Provision
1. SSH into the Ubuntu VM.
2. Install Docker + Docker Compose.
3. Clone/pull the `Trustlink` repo into `/opt/trustlink` or similar.

### 2.2 Environment
Create `backend/.env`:

```bash
PORT=8080
DATABASE_URL=postgres://postgres:<STRONG_PASSWORD>@postgres:5432/trustlink?sslmode=disable
REDIS_URL=redis://redis:6379/0
FIREBASE_PROJECT_ID=trustlink-1bae8
GOOGLE_APPLICATION_CREDENTIALS=/secrets/firebase-service-account.json
GCS_BUCKET=<YOUR_GCS_BUCKET_NAME>
GCS_CREDENTIALS=/secrets/gcs-service-account.json
```

### 2.3 GCS Setup
1. Create a GCS bucket in the GCP project.
2. Create a service account with `Storage Object Admin` role.
3. Download the JSON key and place it on the VM at `backend/secrets/gcs-service-account.json`.
4. Ensure the Firebase Admin JSON is also at `backend/secrets/firebase-service-account.json`.

### 2.4 Networking
- Open VM firewall port `8080` to the internet.

### 2.5 Run
```bash
cd /opt/trustlink/backend
docker compose up -d
docker compose exec api ./server migrate up
```

### 2.6 Verify
- `curl http://<VM_IP>:8080/healthz`
- `curl http://<VM_IP>:8080/readyz`
- `curl http://<VM_IP>:8080/feed`

---

## Phase 3: Frontend Changes

### 3.1 Base URL
Update `frontend/lib/network/api_url/api_url.dart`:

```dart
static const String prodBaseUrl = "http://<VM_PUBLIC_IP>:8080";
static const String devBaseUrl = "http://<VM_PUBLIC_IP>:8080";
```

### 3.2 Android cleartext traffic
Add to `android/app/src/main/AndroidManifest.xml` inside `<application>`:

```xml
android:usesCleartextTraffic="true"
```

### 3.3 Post model
Update `frontend/lib/models/home/user_model.dart`:

```dart
class Post {
  final String id;
  final String authorId;
  final String authorDisplayName;
  final String authorAvatarUrl;
  final String createdAt;
  final String content;
  final String? mediaUrl;

  Post({
    required this.id,
    required this.authorId,
    required this.authorDisplayName,
    required this.authorAvatarUrl,
    required this.createdAt,
    required this.content,
    this.mediaUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    authorId: json['authorId'],
    authorDisplayName: json['authorDisplayName'] ?? 'Unknown',
    authorAvatarUrl: json['authorAvatarUrl'] ?? '',
    createdAt: json['createdAt'],
    content: json['content'],
    mediaUrl: json['mediaUrl'],
  );
}
```

### 3.4 HomePage feed
Replace hardcoded `fetchPosts()` in `frontend/lib/view/home_page/home_screen.dart` with:

```dart
Future<List<Post>> fetchPosts() async {
  final res = await dio.get(ApiEndpoints.feed);
  return (res.data as List).map((e) => Post.fromJson(e)).toList();
}
```

### 3.5 Create post
In the share/create-post screen:
1. Text-only: `POST /posts` with `{ "content": "..." }`.
2. With image:
   - `POST /uploads/presign` with filename and content type.
   - `PUT` file bytes to `putUrl`.
   - `POST /posts` with `{ "content": "...", "mediaUrl": publicUrl }`.

### 3.6 Auth gate
On app start:
- If `FirebaseAuth.instance.currentUser == null`, route to login.
- Else refresh ID token and route to `ButtonNavigation`.

---

## Phase 4: Testing

1. From local machine, verify backend endpoints with `curl`.
2. Install debug APK on physical Android device.
3. Test sign-up → backend bootstraps user via `/me`.
4. Test create text post → appears in `/feed`.
5. Test create image post via GCS presign → appears in `/feed` with image.

---

## Phase 5: Next Steps (after basic integration works)

- Add Nginx/Caddy reverse proxy with Let's Encrypt HTTPS.
- Replace VM IP with custom domain.
- Remove `usesCleartextTraffic` from AndroidManifest.
- Add pull-to-refresh and pagination on feed.
- Add error handling and offline state.
- Migrate to built-in Kotlin to silence Flutter 3.44+ warnings.

---

## Required Inputs

- VM public IP and SSH credentials.
- GCS bucket name.
- GCS service account JSON key.
