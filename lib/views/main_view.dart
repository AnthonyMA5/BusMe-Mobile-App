import 'package:flutter/material.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/views/home_view.dart';
import 'package:busme/views/settings_view.dart';
import 'package:busme/views/notices_view.dart';
import 'package:busme/views/routes_view.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/paths/icon_paths.dart';

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
                file: IconPaths.home,
                color: AppColors.navbarUnselectedColor,
                height: 18.sp,
              ),
              activeIcon: FUI(
                file: IconPaths.homeSelected,
                color: AppColors.navbarSelectedColor,
                height: 18.sp,
              ),
              label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: FUI(
              file: IconPaths.routes,
              color: AppColors.navbarUnselectedColor,
              height: 18.sp,
            ),
            activeIcon: FUI(
              file: IconPaths.routesSelected,
              color: AppColors.navbarSelectedColor,
              height: 18.sp,
            ),
            label: 'Rutas',
          ),
          BottomNavigationBarItem(
            icon: FUI(
              file: IconPaths.notice,
              color: AppColors.navbarUnselectedColor,
              height: 18.sp,
            ),
            activeIcon: FUI(
              file: IconPaths.noticeSelected,
              color: AppColors.navbarSelectedColor,
              height: 18.sp,
            ),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: FUI(
              file: IconPaths.settings,
              color: AppColors.navbarUnselectedColor,
              height: 18.sp,
            ),
            activeIcon: FUI(
              file: IconPaths.settingsSelected,
              color: AppColors.navbarSelectedColor,
              height: 18.sp,
            ),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
