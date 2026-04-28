import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tạo danh sách 20 liên hệ
    final List<String> contacts = List.generate(20, (index) => 'Contact ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('List View')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          // Tính toán số thứ tự ảnh từ 1.png đến 20.png
          int imageNumber = index + 1;

          return ListTile(
            // Sử dụng ClipOval để bo tròn ảnh đại diện
            leading: ClipOval(
              child: Image.asset(
                'assets/$imageNumber.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover, // Đảm bảo ảnh không bị méo
                // Nếu ảnh bị lỗi hoặc thiếu, sẽ tự động hiển thị lại Icon mặc định
                errorBuilder: (context, error, stackTrace) => const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            title: Text(contacts[index]),
            subtitle: const Text('Flutter Developer'),
            onTap: () {
              // Xử lý sự kiện khi nhấn vào liên hệ (nếu cần)
            },
          );
        },
      ),
    );
  }
}