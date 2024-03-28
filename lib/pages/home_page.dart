import 'package:flutter/material.dart';
import 'package:quick_chop/utils/drawer_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Chop'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: const Column(),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const Column(
          children: [DrawerTile()],
        ),
      ),
    );
  }
}
