import 'package:flutter/material.dart';

class DebounceTestScreen extends StatefulWidget {
  const DebounceTestScreen({super.key});

  @override
  State<DebounceTestScreen> createState() => _DebounceTestScreenState();
}

class _DebounceTestScreenState extends State<DebounceTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debounce Test'),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
