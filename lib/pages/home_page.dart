import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:quick_chop/pages/cart_page.dart';
import 'package:quick_chop/pages/menu_page.dart';
import 'package:quick_chop/pages/profile_page.dart';
import 'package:quick_chop/utils/drawer_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

 List<Widget> pages = [MenuPage(), const CartPage(), const ProfilePage()];
int currentPage = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const Column(
          children: [DrawerTile()],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        showElevation: true,

        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.restaurant_menu),
            title: const Text('Menu'),
            activeColor: Theme.of(context).colorScheme.primary,
            textAlign: TextAlign.center,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
        curve: Curves.bounceInOut,
      ),
    );
  }
}
