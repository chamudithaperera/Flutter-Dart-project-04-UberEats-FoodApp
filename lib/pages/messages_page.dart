import 'package:flutter/material.dart';
import 'chat_list.dart';
import 'chat.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF06C167), // Use green theme color
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Sidebar menu action
          },
        ),
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.black),
            SizedBox(width: 5),
            Text(
              'Western Province, Kalutara',
              style: TextStyle(fontSize: 13, color: Colors.black),
            ), // Location text
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'), // Profile image
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: [
            Tab(icon: Icon(Icons.chat, color: Colors.black), text: 'Chat List'),
            Tab(icon: Icon(Icons.message, color: Colors.black), text: 'Chat'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatList(tabController: _tabController),  // Chat List Tab
          Chat(),                                  // Chat Tab
        ],
      ),
    );
  }
}
