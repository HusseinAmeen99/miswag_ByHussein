import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project2_fitch_sonic/profile.dart';
import 'package:project2_fitch_sonic/search.dart';

import 'favourite.dart';
import 'home.dart';
import 'menu.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _navigateTo(int index,BuildContext){
    setState(() {
      _selectedIndex = index; // update selected tab
    });
  }

  final List<Widget> _pages=[
    Home(),
    Favourite(),
    Search(),
    Profile(),
    Menu(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: (value) => _navigateTo(value, BuildContext),
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home.svg',colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),),activeIcon:SvgPicture.asset('assets/icons/home.svg',colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),), label: "Home"),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/heart.svg',colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),),activeIcon:SvgPicture.asset('assets/icons/heart.svg',colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),), label: "Favourites"),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/search.svg',colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),),activeIcon:SvgPicture.asset('assets/icons/search.svg',colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),), label: "Search"),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/profile.svg',colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),),activeIcon:SvgPicture.asset('assets/icons/profile.svg',colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),), label: "Profile"),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/menu.svg',colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),),activeIcon:SvgPicture.asset('assets/icons/menu.svg',colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),), label: "Menu"),
          ]),
    );
  }
}