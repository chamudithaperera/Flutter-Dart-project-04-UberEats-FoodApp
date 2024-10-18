import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final TabController tabController;

  ChatList({required this.tabController});

  final List<Map<String, String>> chats = [
    {'name': 'Pizza Hut', 'message': 'Hey! How are you?', 'time': '2:00 PM'},
    {'name': 'KFC', 'message': 'Are you coming to the event?', 'time': '1:45 PM'},
    {'name': 'Mr.Kottu', 'message': 'Let\'s catch up tomorrow.', 'time': '12:30 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF06C167),
                child: Text(
                  chat['name']![0], // First letter of the name
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                chat['name']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(chat['message']!),
              trailing: Text(chat['time']!),
              onTap: () {
                // Switch to Chat Tab
                tabController.animateTo(1);
              },
            ),
          );
        },
      ),
    );
  }
}
