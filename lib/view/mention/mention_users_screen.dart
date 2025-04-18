
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentionUsersScreen extends StatefulWidget {
  const MentionUsersScreen({super.key});

  @override
  State<MentionUsersScreen> createState() => _MentionUsersScreenState();
}

class _MentionUsersScreenState extends State<MentionUsersScreen> {
  final List<Map<String, dynamic>> allUsers = [
    {"name": "Archi Maze", "occupation": "Entrepreneur", "location": "Noida, Sector-18", "imageUrl": "https://via.placeholder.com/150", "selected": false},
    {"name": "Ravi Sharma", "occupation": "Designer", "location": "Delhi, Sector-23", "imageUrl": "https://via.placeholder.com/150", "selected": false},
    {"name": "Priya Singh", "occupation": "Developer", "location": "Mumbai, Sector-9", "imageUrl": "https://via.placeholder.com/150", "selected": false},
    {"name": "Aman Kumar", "occupation": "Entrepreneur", "location": "Noida, Sector-18", "imageUrl": "https://via.placeholder.com/150", "selected": false},
    {"name": "Sara Khan", "occupation": "Manager", "location": "Bangalore, Sector-12", "imageUrl": "https://via.placeholder.com/150", "selected": false},
  ];

  List<Map<String, dynamic>> filteredUsers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredUsers = List.from(allUsers);
  }

  void filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredUsers = List.from(allUsers);
      } else {
        filteredUsers = allUsers
            .where((user) =>
            user['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Mention other people",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.w),
            width: 30.r,
            height: 30.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2.5,
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.close_rounded,
                size: 20.sp,
                color: Colors.black,
              ),
              onPressed: () {
                // Close button action
                Navigator.pop(context);
              },
              padding: EdgeInsets.zero,
            ),
          ),
        ],


      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: TextField(
              controller: searchController,
              onChanged: filterUsers,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, size: 20.sp),
                hintText: "Search here..",
                hintStyle: TextStyle(fontSize: 14.sp),
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // User list
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      filteredUsers[index]['selected'] = !filteredUsers[index]['selected'];
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6.r,
                          spreadRadius: 1.r,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        // Profile Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image.network(
                            user['imageUrl'],
                            width: 45.r,
                            height: 45.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        // User Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name'],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  Icon(Icons.business, size: 12.sp, color: Colors.grey),
                                  SizedBox(width: 5.w),
                                  Text(
                                    user['occupation'],
                                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 12.sp, color: Colors.grey),
                                  SizedBox(width: 5.w),
                                  Text(
                                    user['location'],
                                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Checkbox
                        Checkbox(
                          value: user['selected'],
                          onChanged: (value) {
                            setState(() {
                              filteredUsers[index]['selected'] = value!;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}