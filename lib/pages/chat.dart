import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {'sender': 'me', 'message': 'Hey! How are you?'},
    {'sender': 'them', 'message': 'I\'m good, how about you?'},
    {'sender': 'me', 'message': 'Doing great, thanks!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return Align(
                alignment: message['sender'] == 'me'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: message['sender'] == 'me'
                        ? Color(0xFF06C167) // Green for user
                        : Colors.grey[300], // Light grey for others
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    message['message']!,
                    style: TextStyle(
                      color: message['sender'] == 'me'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        _buildMessageInput(), // Input field to send a message
      ],
    );
  }

  // Message Input Field
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFF06C167)),
            onPressed: () {
              // Send message action
            },
          ),
        ],
      ),
    );
  }
}
