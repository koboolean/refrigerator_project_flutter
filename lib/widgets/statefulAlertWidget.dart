import 'dart:async';

import 'package:flutter/material.dart';

Future<dynamic> showStatefulWidgetDialog(BuildContext context) async {
  await showDialog<void>(
    context: context,
    builder: (_) {
      return MyStatefulDialog();
    },
  );
}

// StatefulWidget으로 dialog 작성
class MyStatefulDialog extends StatefulWidget {
  @override
  State<MyStatefulDialog> createState() => _MyStatefulDialogState();
}

class _MyStatefulDialogState extends State<MyStatefulDialog> {
  int? selectedRadio = 0;

  // 변수 초기화
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  Duration _elapsedTime = Duration.zero;

  // 타이머 시작
  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer){
      _onTick(timer);
    });
  }

  // 타이머 정지
  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  // 타이머 리셋
  void _resetTimer() {
    setState(() {
      _stopwatch.reset();
      _elapsedTime = Duration.zero;
    });
  }

  // 타이머 콜백
  void _onTick(Timer timer) {
    setState(() {
      _elapsedTime = _stopwatch.elapsed;
    });
    _stopwatch.start();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${_elapsedTime.inMinutes}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0')}',
            style: TextStyle(fontSize: 60.0),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _startTimer,
                child: Text("Start"),
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: _stopTimer,
                child: Text("Stop"),
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: _resetTimer,
                child: Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
