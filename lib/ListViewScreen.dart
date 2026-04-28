import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> contacts = List.generate(20, (index) => 'Contact ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('List View')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(contacts[index]),
            subtitle: const Text('Flutter Developer'),
            onTap: () {},
          );
        },
      ),
    );
  }
}