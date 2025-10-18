import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../home/screens/home_screen.dart';
import '../../settings//screens/settings_screen.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentPageIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SettingsScreen(),
    // ProfileScreen(),
    // SettingsScreen(),
  ];

  void _onPopInvokedWithResult(bool didPop, Object? result) {
    if (didPop) return;
    if (currentPageIndex != 0) {
      setState(() => currentPageIndex = 0);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvokedWithResult ,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            height: size.height * 0.08,
            indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            indicatorColor: tPrimary,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Badge(child: Icon(Icons.settings_outlined)),
                label: 'Settings',
              ),
            ]
        ),
        body: IndexedStack(
          index: currentPageIndex,
          children: _screens,
        ),
      ),
    );
  }
}