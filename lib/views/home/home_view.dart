import 'package:ecommerce1/views/home/account_view.dart';
import 'package:ecommerce1/views/home/cart_view.dart';
import 'package:ecommerce1/views/home/explore_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentindex = 0;
  List<Widget> bodyList = [ExploreView(), CartView(), AccountView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/explore_icon.png'),
                activeIcon: Image.asset('assets/explore_txt.png'),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/cart_icon.png'),
                activeIcon: Image.asset('assets/cart_txt.png'),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/account_icon.png'),
                activeIcon: Image.asset('assets/account_txt.png'),
                label: 'Account'),
          ]),
    );
  }
}
