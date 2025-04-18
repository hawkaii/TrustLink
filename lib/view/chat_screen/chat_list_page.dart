import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat_details_screen.dart';

class ChatListScreen extends StatefulWidget {
  final ScrollController scrollController;
  const ChatListScreen({super.key, required this.scrollController,});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {

  final List<Chat> _allChats = [
    Chat(
        name: "John Golfer",
        message: "Lorem ipsum dollar is a multi...",
        time: "3 days ago",
        unreadCount: 0),
    Chat(
        name: "Cristiano Ronaldo",
        message: "Hello, how are you?",
        time: "2 days ago",
        unreadCount: 5),
    Chat(
        name: "Ankit Patel",
        message: "Are we meeting today?",
        time: "1 day ago",
        unreadCount: 0),
    Chat(
        name: "Suraj Dost",
        message: "Are we meeting today?",
        time: "6 days ago",
        unreadCount: 0),
    Chat(
        name: "Rolando",
        message: "Are we meeting today?",
        time: "3 days ago",
        unreadCount: 3),
    Chat(
        name: "Messi",
        message: "Are we meeting today?",
        time: "5 days ago",
        unreadCount: 0),
    Chat(
        name: "Rocky Bhai",
        message: "Are you busy today?",
        time: "10 days ago",
        unreadCount: 0),
    Chat(
        name: "Anurag",
        message: "Are we meeting today?",
        time: "15 days ago",
        unreadCount: 0),
    Chat(
        name: "Miss Anjali",
        message: "Are we meeting today?",
        time: "2 days ago",
        unreadCount: 3),
    Chat(
        name: "Pushpa",
        message: "Are we meeting today?",
        time: "19 days ago",
        unreadCount: 0),
    Chat(
        name: "Singham",
        message: "Are we meeting today?",
        time: "3 days ago",
        unreadCount: 0),
    Chat(
        name: "Lionel Messi",
        message: "Are we meeting today?",
        time: "1 day ago",
        unreadCount: 0),
  ];

  List<Chat> _filteredChats = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredChats = _allChats;
    _searchController.addListener(_searchChats);
  }

  @override
  void dispose() {
    _searchController.removeListener(_searchChats);
    _searchController.dispose();
    super.dispose();
  }

  void _searchChats() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredChats = _allChats.where((chat) {
        return chat.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("My Chats", style: TextStyle(fontSize: size.width * 0.05)),
        centerTitle: true,
      ),
      body: CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.02,
            ),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Any particular chat?...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Column(
                  children: [
                    ChatTile(
                      size: size,
                      chat: _filteredChats[index],
                    ),
                    Divider(
                      color: _filteredChats[index].unreadCount > 0
                          ? Colors.blue
                          : Colors.grey[300],
                      thickness: 1,
                      indent: 85,
                    ),
                  ],
                );
              },
              childCount: _filteredChats.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final Size size;
  final Chat chat;

  const ChatTile({super.key,
    required this.size,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: size.width * 0.07,
        backgroundImage: const NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-C_UAhXq9GfuGO452EEzfbKnh1viQB9EDBQ&s"),
      ),
      title: Text(
        chat.name,
        style: TextStyle(
            fontSize: size.width * 0.045, fontWeight: FontWeight.w500),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chat.message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: size.width * 0.035, color: Colors.grey),
          ),
          SizedBox(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chat.time,
                style:
                TextStyle(fontSize: size.width * 0.03, color: Colors.grey),
              ),
              Row(
                children: [
                  if (chat.unreadCount > 0)
                    CircleAvatar(
                      radius: size.width * 0.035,
                      backgroundColor: Colors.blue,
                      child: Text(
                        chat.unreadCount.toString(),
                        style: TextStyle(
                            fontSize: size.width * 0.03, color: Colors.white),
                      ),
                    ),
                  SizedBox(width: size.width * 0.02),
                  Icon(Icons.arrow_forward_ios, size: size.width * 0.04),
                ],
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Get.to(ChatDetailsScreen(name: chat.name));
      },
    );
  }
}

class Chat {
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });
}
