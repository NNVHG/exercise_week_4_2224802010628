import 'package:flutter/material.dart';

class ListViewExercise extends StatelessWidget {
  const ListViewExercise({super.key});

  @override
  Widget build(BuildContext context) {
    // Tạo danh sách 20 liên hệ mẫu
    final List<String> contacts = List.generate(20, (index) => 'Contact ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('List View')),
      // Sử dụng ListView.builder để tối ưu hiệu suất cho danh sách cuộn
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person), // Ảnh đại diện giữ chỗ (placeholder avatar)
            ),
            title: Text(contacts[index]),
            subtitle: const Text('Flutter Developer'),
            onTap: () {
              // Xử lý khi nhấn vào liên hệ
            },
          );
        },
      ),
    );
  }
}