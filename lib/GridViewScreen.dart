import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  // Thêm biến startIndex để tính toán đúng file ảnh từ 1.png đến 24.png
  Widget _buildGridItem(int index, int startIndex) {
    int imageNumber = index + startIndex; // Số thứ tự của ảnh

    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Dùng Expanded để ảnh tự động co giãn vừa khung hình mà không bị lỗi tràn (overflow)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Bo góc cho bức ảnh
                child: Image.asset(
                  'assets/$imageNumber.png',
                  fit: BoxFit.cover, // Cắt ảnh cho vừa vặn
                  // Hàm này giúp hiển thị icon lỗi nếu nhầm tên file thay vì làm crash app
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text('Item $imageNumber', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid View')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Fixed Column Grid (Image 1 - 12)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
                // Truyền startIndex là 1 -> Load ảnh từ 1.png đến 12.png
                children: List.generate(12, (index) => _buildGridItem(index, 1)),
              ),
              const Divider(height: 32, thickness: 2),
              const Text("Responsive Grid (Image 13 - 24)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              GridView.extent(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
                // Truyền startIndex là 13 -> Load ảnh từ 13.png đến 24.png
                children: List.generate(12, (index) => _buildGridItem(index, 13)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}