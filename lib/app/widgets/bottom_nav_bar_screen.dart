import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/modules/home/home_screen.dart';
import 'package:mapalus_pos_2/app/modules/order/order_screen.dart';
import 'package:mapalus_pos_2/app/modules/report/report_screen.dart';
import 'package:mapalus_pos_2/app/modules/setting/setting_screen.dart';
import 'package:mapalus_pos_2/shared/shared.dart';
class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen>  {
  int currentPageIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const OrderScreen(),
    const ReportScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            selectedIcon: Icon(Icons.list_alt),
            label: 'Order',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Report',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
      body: SafeArea(
        child: screens[currentPageIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.transaction,
          );
        },
        child: const Icon(Icons.shopping_bag),
      ),
    );
  }


}
