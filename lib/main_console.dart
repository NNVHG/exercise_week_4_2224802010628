import 'dart:async';
import 'dart:isolate';
import 'dart:math';

// Hàm của tiểu trình phụ (Worker Isolate)
void workerIsolate(SendPort mainSendPort) {
  final receivePort = ReceivePort();
  // Gửi SendPort của worker về cho Main Isolate để thiết lập liên lạc 2 chiều
  mainSendPort.send(receivePort.sendPort);

  Timer.periodic(const Duration(seconds: 1), (timer) {
    int randomNum = Random().nextInt(20) + 1; // Số ngẫu nhiên từ 1-20
    mainSendPort.send(randomNum); // Gửi số mỗi giây
  });

  // Lắng nghe lệnh từ Main Isolate
  receivePort.listen((message) {
    if (message == 'stop') {
      print('Worker Isolate: Nhận lệnh dừng. Đang thoát...');
      Isolate.exit(); // Thoát graceful
    }
  });
}

void main() async {
  final mainReceivePort = ReceivePort();

  // Sinh ra tiểu trình nền
  await Isolate.spawn(workerIsolate, mainReceivePort.sendPort);

  SendPort? workerSendPort;
  int currentSum = 0;

  // Lắng nghe dữ liệu từ Worker Isolate
  await for (var message in mainReceivePort) {
    if (message is SendPort) {
      workerSendPort = message; // Lấy cổng gửi của worker
    } else if (message is int) {
      currentSum += message;
      print('Main Isolate: Nhận được $message. Tổng hiện tại: $currentSum');

      // Nếu tổng vượt quá 100
      if (currentSum > 100) {
        print('Main Isolate: Tổng vượt quá 100. Đang gửi lệnh stop...');
        workerSendPort?.send('stop'); // Gửi lệnh dừng
        mainReceivePort.close(); // Đóng cổng nhận ở Main
        break;
      }
    }
  }
  print('Chương trình kết thúc.');
}