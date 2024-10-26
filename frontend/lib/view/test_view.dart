import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test View'),
      ),
      body: const Center(
        child: Text(
          'This is a Test View',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}