import 'package:flutter/material.dart';

// Import đúng tên các tệp đã được đổi
import 'list_view.dart';
import 'grid_view.dart';
import 'shared_preferences.dart';
import 'async.dart';
import 'isolate_challenge_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Week 4',
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
        title: const Text('Week 4 - Nguyễn Ngô Vũ Hoàng Gia'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListViewExercise()));
                },
                child: const Text('Exercise 1: List View'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GridViewExercise()));
                },
                child: const Text('Exercise 2: Grid View'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SharedPreferences()));
                },
                child: const Text('Exercise 3: Shared Preferences'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Async()));
                },
                child: const Text('Exercise 4: Asynchronous'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const IsolateChallenge1()));
                },
                child: const Text('Exercise 5: Isolate (Challenge 1)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}