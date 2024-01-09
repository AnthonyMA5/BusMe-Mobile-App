import 'package:flutter/material.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/views/home_view.dart';
import 'package:busme/views/settings_view.dart';
import 'package:busme/views/notices_view.dart';
import 'package:busme/views/routes_view.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/constants/styles/app_text_styles.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeView(),
    RoutesView(),
    NoticesView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 22.sp,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black,
        backgroundColor: AppColors.backgroundColor,
        selectedLabelStyle: AppTextStyles.selectedNavbarText(context),
        unselectedLabelStyle: AppTextStyles.unselectedNavbarText(context),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: FUI(
                file: FUIcons.regularRounded.home,
                color: AppColors.navbarUnselectedColor,
              ),
              activeIcon: FUI(
                file: FUIcons.solidRounded.home,
                color: AppColors.navbarSelectedColor,
              ),
              label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: FUI(
              file: FUIcons.regularRounded.map,
              color: AppColors.navbarUnselectedColor,
            ),
            activeIcon: FUI(
              file: FUIcons.solidRounded.map,
              color: AppColors.navbarSelectedColor,
            ),
            label: 'Rutas',
          ),
          BottomNavigationBarItem(
            icon: FUI(
              file: FUIcons.regularRounded.bell,
              color: AppColors.navbarUnselectedColor,
            ),
            activeIcon: FUI(
              file: FUIcons.solidRounded.bell,
              color: AppColors.navbarSelectedColor,
            ),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: FUI(
              file: FUIcons.regularRounded.settings,
              color: AppColors.navbarUnselectedColor,
            ),
            activeIcon: FUI(
              file: FUIcons.solidRounded.settings,
              color: AppColors.navbarSelectedColor,
            ),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
