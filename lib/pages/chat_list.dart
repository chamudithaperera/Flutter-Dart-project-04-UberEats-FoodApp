import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final TabController tabController;

  ChatList({super.key, required this.tabController});

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Pizza Hut',
      'message': 'Hey! How are you?',
      'time': '2:00 PM',
      'unread': 3,
      'image': 'assets/pizza_hut.png'
    },
    {
      'name': 'KFC',
      'message': 'Are you coming to the event?',
      'time': '1:45 PM',
      'unread': 1,
      'image': 'assets/kfc.png'
    },
    {
      'name': 'Mr.Kottu',
      'message': 'Let\'s catch up tomorrow.',
      'time': '12:30 PM',
      'unread': 0,
      'image': 'assets/mr_kottu.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF06C167).withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color(0xFF06C167).withOpacity(0.1),
                  child: Text(
                    chat['name']![0],
                    style: const TextStyle(
                      color: Color(0xFF06C167),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              title: Row(
                children: [
                  Text(
                    chat['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    chat['time']!,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        chat['message']!,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (chat['unread'] > 0)
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF06C167),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          chat['unread'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              onTap: () => tabController.animateTo(1),
            ),
          );
        },
      ),
    );
  }
}