import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/screen/favorites.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    //SearchPage(),
    FavoritesScreen(),
   // ProfilePage(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
    );
  }
}

class MainScreenWithBottomNavBar extends StatefulWidget {
  const MainScreenWithBottomNavBar({super.key});

  @override
  _MainScreenWithBottomNavBarState createState() => _MainScreenWithBottomNavBarState();
}

class _MainScreenWithBottomNavBarState extends State<MainScreenWithBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MainScreen(),
   // SearchPage(),
    FavoritesScreen(),
   // ProfilePage(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  final int currentIndex;
  const BottomNavBar({
    super.key,
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Colors.pink,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: widget.currentIndex,
          onTap: widget.onItemSelected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
