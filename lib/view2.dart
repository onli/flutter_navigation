import 'package:flutter/material.dart';

class View2 extends StatelessWidget {
  const View2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View 2')),
      body: const Center(
        child: Text('View 2'),
      ),
    );
  }
}
