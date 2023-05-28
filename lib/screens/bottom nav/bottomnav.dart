import 'package:e_commerce/screens/bottom%20nav/home.dart';
import 'package:e_commerce/screens/bottom%20nav/history.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'profile.dart';
import 'wishlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;

List<Widget> pages = [
  const Home(),
  const WishList(),
  const History(),
  const Profile()
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color(0xff67C4A7),
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home_25), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.transaction_minus),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.profile_add),
              label: 'profile',
            )
          ]),
    );
  }
}
