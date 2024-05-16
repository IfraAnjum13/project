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
      child: Container(
        height: 60, // Adjust the height as needed
        color: Colors.blue, // Set the background color here
        child: BottomNavigationBar(
        //  backgroundColor: Colors.transparent, // Make the background transparent
          selectedItemColor: Colors.black, // Set selected item color
          unselectedItemColor: Colors.black, // Set unselected item color
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
      ),
    );
  }
}
