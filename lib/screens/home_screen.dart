
import 'package:assignment220190369/widgets/home.dart';
import 'package:assignment220190369/widgets/module.dart';
import 'package:assignment220190369/widgets/settings.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = [
    Module(),
    Home(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.book,
              size: 30,
            ),
            icon: Icon(
              Icons.book_outlined,
              size: 30,
            ),
            label: 'Module',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.settings,
              size: 30,
            ),
            icon: Icon(
              Icons.settings_outlined,
              size: 30,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
