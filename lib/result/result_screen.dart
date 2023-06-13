import 'package:flutter/material.dart';

/// 상태 변경이 없다면 StatelessWidget을 사용한다. setState가 되지 않는다.
class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '정상',
              style: TextStyle(fontSize: 36),
            ),
            Icon(
              Icons.sentiment_satisfied,
              color: Colors.green,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
