import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';

class ScaffoldWithNavbarShell extends StatefulWidget {
  const ScaffoldWithNavbarShell({super.key, required this.child});
  final Widget child;

  @override
  State<ScaffoldWithNavbarShell> createState() =>
      _ScaffoldWithNavbarShellState();
}

class _ScaffoldWithNavbarShellState extends State<ScaffoldWithNavbarShell> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.man), label: 'Auth'),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Weather'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.hearing), label: 'Riverpod'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.dog), label: 'Todo'),
        ],
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (int index) {
          _onTap(index);
        },
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        context.goNamed(AppRoute.auth.name);
      case 1:
        context.goNamed(AppRoute.weather.name);
      case 2:
        context.goNamed(AppRoute.posts.name);
      case 3:
        context.goNamed(AppRoute.riverpodtest.name);
      case 4:
        context.goNamed(AppRoute.todo.name);
    }
  }
}
