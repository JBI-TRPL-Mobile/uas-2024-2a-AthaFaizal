import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Message ${index + 1}'),
            subtitle: const Text('Lorem ipsum dolor sit amet...'),
          );
        },
      ),
    );
  }
}
