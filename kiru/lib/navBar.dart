import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiru/home/homeScreen.dart';
import 'package:kiru/kiruAssets/appImages.dart';
import 'package:kiru/kiruAssets/colors.dart';
import 'package:kiru/profile/profileScreen.dart';
import 'package:kiru/favorite/favoriteScreen.dart';
import 'package:kiru/clothes/clothesScreen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const Clothesscreen(),
    const Profilescreen(),
  ];

  final List<Map<String, dynamic>> _navItems = const [
    {'asset': AppImages.homeicon, 'width': 26.0},
    {'asset': AppImages.hearticon, 'width': 24.0},
    {'asset': AppImages.shelficon, 'width': 18.0},
    {'asset': AppImages.usericon, 'width': 23.0},
  ];

  BottomNavigationBarItem _buildItem(
    String assetName,
    double width,
    int index,
  ) {
    final Color iconColor = _currentIndex == index
        ? AppColors.black
        : AppColors.unselectedButton;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: SvgPicture.asset(
          assetName,
          width: width,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.pureWhite,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: List.generate(
              _navItems.length,
              (index) => _buildItem(
                _navItems[index]['asset'] as String,
                _navItems[index]['width'] as double,
                index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
