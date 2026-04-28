import 'package:flutter/material.dart';

import 'ListViewScreen.dart';
import 'GridViewScreen.dart';
import 'SharedPreferencesScreen.dart';
import 'AsyncScreen.dart';
import 'isolate_challenge_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuần 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuần 4 - Nguyễn Ngô Vũ Hoàng Gia'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListViewScreen()));
                },
                child: const Text('Bài 1: Danh sách cuộn (List View)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GridViewScreen()));
                },
                child: const Text('Bài 2: Dạng lưới (Grid View)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SharedPreferencesScreen()));
                },
                child: const Text('Bài 3: Lưu trữ dữ liệu (Shared Preferences)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AsyncScreen()));
                },
                child: const Text('Bài 4: Lập trình Bất đồng bộ (Async)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const IsolateChallenge1()));
                },
                child: const Text('Bài 5: Đa luồng (Isolate - Thử thách 1)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}