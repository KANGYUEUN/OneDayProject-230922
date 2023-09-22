import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('김밥 테이블 POS'),
        ),
        body: const TableManagement(),
      ),
    );
  }
}

class TableManagement extends StatelessWidget {
  const TableManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3x3 그리드
      ),
      itemBuilder: (BuildContext context, int index) {
        // 각 셀에 원하는 내용을 배치할 수 있습니다.
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              '테이블 ${index + 1}',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        );
      },
    );
  }
}
