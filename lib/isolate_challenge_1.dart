import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Chứa hàm compute

// Hàm tính toán nặng chạy độc lập (phải nằm ngoài class hoặc là static)
String calculateFactorial(int number) {
  BigInt result = BigInt.one;
  for (int i = 1; i <= number; i++) {
    result *= BigInt.from(i);
  }
  // Rút gọn kết quả khi hiển thị vì chuỗi quá dài sẽ làm đơ UI
  String resString = result.toString();
  return "Length of 30,000! is ${resString.length} digits.\nStarts with: ${resString.substring(0, 20)}...";
}

class IsolateChallenge1 extends StatefulWidget {
  const IsolateChallenge1({super.key});

  @override
  State<IsolateChallenge1> createState() => _IsolateChallenge1State();
}

class _IsolateChallenge1State extends State<IsolateChallenge1> {
  bool _isLoading = false;
  String _result = "Press compute to calculate 30,000!";

  Future<void> _startCalculation() async {
    setState(() {
      _isLoading = true;
      _result = "Calculating in background isolate...";
    });

    // Sử dụng compute để chạy trên Isolate riêng
    final String calculated = await compute(calculateFactorial, 30000);

    setState(() {
      _isLoading = false;
      _result = calculated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolate Factorial')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading) const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(_result, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _startCalculation,
                child: const Text('Calculate 30,000!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}