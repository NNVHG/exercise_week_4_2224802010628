import 'package:flutter/material.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({super.key});

  @override
  State<AsyncScreen> createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  String _statusMessage = "Press the button to load user.";
  bool _isLoading = false;

  Future<void> _loadUser() async {
    setState(() {
      _isLoading = true;
      _statusMessage = "Loading user...";
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
      _statusMessage = "User loaded successfully!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asynchronous Task')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(_statusMessage, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _loadUser,
              child: const Text('Load User'),
            ),
          ],
        ),
      ),
    );
  }
}