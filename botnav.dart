import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_crates1/auth/pages/dashboard.dart';
import 'package:rental_crates1/botnavicon/cart.dart';
import 'package:rental_crates1/botnavicon/profile.dart';
import 'package:rental_crates1/botnavicon/store.dart';

class Botnav extends StatefulWidget {
  const Botnav({super.key});

  @override
  State<Botnav> createState() => _BotnavState();
}

class _BotnavState extends State<Botnav> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Dashboard(),
    Store(),
    Cart(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Change index, but keep BottomNavigationBar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rental Crates"),
        actions: [
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('Log-Out')),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex, // Keeps state of each screen
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.grey[300],
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
