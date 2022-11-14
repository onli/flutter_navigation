import 'package:flutter/material.dart';

class View1 extends StatelessWidget {
  final String content;

  const View1({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View 1'),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}
