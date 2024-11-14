import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessageBoardList extends StatelessWidget {
  const MessageBoardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Boards'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile screen (implement Profile screen)
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings screen (implement Settings screen)
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Implement logout functionality
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('General Chat'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen(boardName: 'General Chat')));
            },
          ),
          // Add other boards here
        ],
      ),
    );
  }
}
