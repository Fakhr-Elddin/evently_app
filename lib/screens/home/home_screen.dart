import 'package:evently_app/screens/home/create_event_screen.dart';
import 'package:evently_app/screens/home/tabs/home_tab.dart';
import 'package:evently_app/screens/home/tabs/love_tab.dart';
import 'package:evently_app/screens/home/tabs/map_tab.dart';
import 'package:evently_app/screens/home/tabs/profile_tab.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    HomeTab(),
    MapTab(),
    LoveTab(),
    ProfileTab(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(75),
          side: BorderSide(
            color: AppColors.backgroundColorLight,
            width: 4,
          ),
        ),
        onPressed: (){
          Navigator.pushNamed(context, CreateEventScreen.routeName,);
        },
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          if(index != selectedIndex){
            selectedIndex = index;
            setState(() {});
          }
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: ImageIcon(
              AssetImage(
                AssetsManager.homeIcon,
              ),
            ),
            activeIcon: ImageIcon(
              AssetImage(
                AssetsManager.homeActiveIcon,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Map',
            icon: ImageIcon(
              AssetImage(
                AssetsManager.mapIcon,
              ),
            ),
            activeIcon: ImageIcon(
              AssetImage(
                AssetsManager.mapActiveIcon,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Love',
            icon: ImageIcon(
              AssetImage(
                AssetsManager.loveIcon,
              ),
            ),
            activeIcon: ImageIcon(
              AssetImage(
                AssetsManager.loveActiveIcon,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: ImageIcon(
              AssetImage(
                AssetsManager.profileIcon,
              ),
            ),
            activeIcon: ImageIcon(
              AssetImage(
                AssetsManager.profileActiveIcon,
              ),
            ),
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
