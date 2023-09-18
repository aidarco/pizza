import 'package:flutter/material.dart';
import 'package:pizza/pizzaApp/appPages/ShopPage.dart';

import '../components/bottom_nav_bar.dart';
import 'CartPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePagestate();
}

class _HomePagestate extends State<HomePage> {
  int _selectedIndex = 0;

  void navBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu_rounded),
          );
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100]?.withOpacity(0.7).withAlpha(70),
        elevation: 4,
        child: Column(
          children: [
            DrawerHeader(child: Image.asset("lib/images/пиццылого.png")),
            Divider(
              color: Colors.deepPurple[100]?.withOpacity(0.6).withAlpha(70),
            ),
            const ListTile(
              leading: Icon(
                Icons.access_alarm,
                color: Colors.deepOrangeAccent,
              ),
              title: Text(
                "Work hours",
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.deepOrangeAccent,
              ),
              title: Text(
                "about us",
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.deepOrangeAccent,
              ),
              title: Text(
                "Ads",
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed("/"),
              child: const ListTile(
                leading: Icon(
                  Icons.logout_sharp,
                  color: Colors.deepOrangeAccent,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: navBar,
      ),
      backgroundColor: Colors.deepPurple[100]?.withOpacity(0.5),
      body: _pages[_selectedIndex],
    );
  }
}

final List<Widget> _pages = [ShopPage(), CartPage()];
