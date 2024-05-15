import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  final int currentIndex;
  const BottomNavBar({
    Key? key,
    required this.onItemSelected,
    required this.currentIndex,
  }) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.blue,
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: widget.currentIndex,
        onTap: widget.onItemSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '.',
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
    );
  }
}