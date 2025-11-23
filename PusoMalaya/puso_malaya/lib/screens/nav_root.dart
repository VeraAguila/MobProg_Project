import 'package:flutter/material.dart';
import 'package:puso_malaya/screens/favorite_screen.dart';
import 'package:puso_malaya/screens/home_screen.dart';
import 'package:puso_malaya/screens/profile_screen.dart';
import 'package:puso_malaya/screens/search_screen.dart';

class NavRoot extends StatefulWidget {
  const NavRoot({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavRootState();
  }
}

class _NavRootState extends State<NavRoot> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
