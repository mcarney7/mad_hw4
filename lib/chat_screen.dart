import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  final String boardName;
  const ChatScreen({required this.boardName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(boardName)),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('messageBoards')
            .doc(boardName)
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No messages yet.'));
          }

          final messages = snapshot.data!.docs;

          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final messageData = messages[index];
              return ListTile(
                title: Text(messageData['username']),
                subtitle: Text(messageData['message']),
                trailing: Text(
                  (messageData['timestamp'] as Timestamp).toDate().toString(),
                  style: const TextStyle(fontSize: 10),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
