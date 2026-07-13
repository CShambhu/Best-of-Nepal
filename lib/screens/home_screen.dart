import 'package:best_of_nepal/screens/contributors.dart';
import 'package:best_of_nepal/screens/home_content.dart';
import 'package:best_of_nepal/screens/profile.dart';
import 'package:best_of_nepal/screens/saved.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // final List<String> _titles = ["a"];

  final List<Widget> _screens = [
    HomeContent(),
    Saved(),
    Contributors(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _selectedIndex == 0
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset("assets/images/girl.png", height: 250),
                ),
              )
            : null,

        title: _selectedIndex == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Annie January",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text("Basic Account", style: TextStyle(fontSize: 15)),
                ],
              )
            : null,

        actions: _selectedIndex == 0
            ? [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Icon(Icons.notifications, size: 20),
                  ),
                ),
              ]
            : null,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        backgroundColor: const Color.fromARGB(255, 83, 117, 133),
        activeColor: const Color.fromARGB(255, 167, 219, 247),
        color: Colors.white,
        style: GnavStyle.oldSchool,
        textSize: 13,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: [
          GButton(icon: Icons.home, text: "Home"),
          GButton(icon: Icons.save, text: "Saved"),
          GButton(icon: Icons.domain_verification, text: "Contributors"),
          GButton(icon: Icons.person, text: "Profile"),
        ],
      ),
    );
  }
}
