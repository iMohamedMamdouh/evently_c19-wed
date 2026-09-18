import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:evently_c19/modules/event/screens/add_event_screen.dart';
import 'package:evently_c19/modules/home/tabs/favourite_tab.dart';
import 'package:evently_c19/modules/home/tabs/home_tab.dart';
import 'package:evently_c19/modules/home/tabs/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const FavouriteTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEventScreen()),
          ).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: theme.cardColor,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: AppColors.grayColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
