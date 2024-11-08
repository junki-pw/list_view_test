import 'package:flutter/material.dart';
import 'package:test_list_view/features/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ListView Test'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListViewTest()),
                  );
                },
                child: const Text('ListView Test'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListViewColumnTest()),
                  );
                },
                child: const Text('ListView Column Test'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SingleChildScrollViewTest()),
                  );
                },
                child: const Text('SingleChildScrollView Test'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListViewWithColumnTest()),
                  );
                },
                child: const Text('ListViewWithColumn Test'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SliverListTest()),
                  );
                },
                child: const Text('SliverList Test'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClashDemo()),
                  );
                },
                child: const Text('Clash demo'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
