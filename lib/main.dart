import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter 구조 이해')),
        body: SafeArea(
          child: Column(
            children: [
              Text('안녕하세요'),
              Text('Flutter입니다'),
              ElevatedButton(
                onPressed: () {
                  print('버튼 눌림');
                },
                child: Text('버튼'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}