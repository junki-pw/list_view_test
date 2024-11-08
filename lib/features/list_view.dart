import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListViewTest extends StatelessWidget {
  const ListViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewList() {
      return [
        for (var i = 0; i < 100; i++) ListTile(title: Text('Item $i')),
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: ListView(
        children: [
          ...listViewList(),
        ],
      ),
    );
  }
}

class ListViewColumnTest extends StatelessWidget {
  const ListViewColumnTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Column Test'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              for (var i = 0; i < 100; i++) ListTile(title: Text('Item $i')),
            ],
          ),
        ],
      ),
    );
  }
}

class SingleChildScrollViewTest extends StatelessWidget {
  const SingleChildScrollViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < 100; i++) ListTile(title: Text('Item $i')),
          ],
        ),
      ),
    );
  }
}

class ListViewWithColumnTest extends StatelessWidget {
  const ListViewWithColumnTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView Test'),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < 100; i++) ListTile(title: Text('Item $i')),
          Column(
            children: [
              for (var i = 0; i < 100; i++)
                Card(
                    color: Colors.red, child: ListTile(title: Text('Item $i'))),
            ],
          ),
        ],
      ),
    );
  }
}

class SliverListTest extends StatelessWidget {
  const SliverListTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverList Test'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item $index')),
              childCount: 100,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                  color: Colors.greenAccent.withOpacity(1),
                  child: ListTile(title: Text('Item $index'))),
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class ClashDemo extends StatelessWidget {
  const ClashDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clash demo'),
      ),
      body: FutureBuilder<Uint8List>(
          future: _fetchBytes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final Uint8List? bytes = snapshot.data;
            if (bytes == null) {
              return const Center(
                child: Text('ERROR'),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < 10000; i++)
                    Image.memory(
                      snapshot.data!,
                    ),
                ],
              ),
            );
          }),
    );
  }

  Future<Uint8List> _fetchBytes() async {
    const String imageUrl =
        'https://firebasestorage.googleapis.com/v0/b/nearlu-staging.appspot.com/o/posts%2F0181a7a6-4088-4aa2-8388-ebac40507c31%2F9a571cf9-549e-4860-92b8-0f07c36bbeb7%2Foriginal?alt=media&token=72095f18-5abb-466a-a314-059c49554017';
    final Uri uri = Uri.parse(imageUrl);
    final http.Response response = await http.get(uri);
    return response.bodyBytes.buffer.asUint8List();
  }
}
