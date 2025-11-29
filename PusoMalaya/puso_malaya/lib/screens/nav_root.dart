import 'package:flutter/material.dart';
import 'package:puso_malaya/model/base_app_user.dart';
import 'package:puso_malaya/screens/favorite_screen.dart';
import 'package:puso_malaya/screens/home_screen.dart';
import 'package:puso_malaya/screens/profile_screen.dart';
import 'package:puso_malaya/screens/search_screen.dart';

class NavRoot extends StatefulWidget {
  const NavRoot(
    this.successfulRegistration,
    this.successMessage, {
    super.key,
    required this.goToHome,
    required this.goToRegister,
    required this.currentUser,
    required this.logout,
  });
  
  final bool successfulRegistration;
  final String successMessage;
  final void Function(BaseAppUser) goToHome;
  // final void Function() goToHome;
  final void Function() goToRegister;
  final BaseAppUser currentUser;
  final void Function() logout;

  @override
  State<StatefulWidget> createState() {
    return _NavRootState();
  }
}

class _NavRootState extends State<NavRoot> {
  int selectedIndex = 0;

  late final List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(
      currentUser: widget.currentUser,
      logout: widget.logout,
    ),
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

        selectedItemColor: const Color(0xFFFFEB3B),
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
