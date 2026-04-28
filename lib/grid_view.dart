import 'package:flutter/material.dart';

class GridViewExercise extends StatelessWidget {
  const GridViewExercise({super.key});

  Widget _buildGridItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12), // Góc bo tròn
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.image, size: 40, color: Colors.blue), // Biểu tượng ở giữa
          const SizedBox(height: 8),
          Text('Item ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)), // Nhãn văn bản
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
              const Text("Fixed Column Grid", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3, // 3 cột
                mainAxisSpacing: 8, // Khoảng cách hàng
                crossAxisSpacing: 8, // Khoảng cách cột
                childAspectRatio: 1, // Tỷ lệ khung hình
                children: List.generate(12, (index) => _buildGridItem(index)),
              ),
              const Divider(height: 32, thickness: 2),
              const Text("Responsive Grid", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              GridView.extent(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                maxCrossAxisExtent: 150, // Chiều rộng tối đa
                mainAxisSpacing: 10, // Khoảng cách hàng
                crossAxisSpacing: 10, // Khoảng cách cột
                childAspectRatio: 0.8, // Tỷ lệ khung hình
                children: List.generate(12, (index) => _buildGridItem(index)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}