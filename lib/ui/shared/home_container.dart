// import 'package:news_api/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:news_api/constant/app_assets.dart';
import 'package:news_api/ui/shared/screen_util.dart';
import 'package:news_api/ui/views/blog_list_view.dart';
import 'package:news_api/ui/views/favourite_view.dart';
import 'package:news_api/ui/views/profile_view.dart';
import 'package:news_api/ui/views/setting_view.dart';

import 'package:news_api/ui/widgets/navbar_widget.dart';

import 'app_colors.dart';

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int _selectedIndex = 0;
  static const TextStyle _textStyle =
      TextStyle(fontWeight: FontWeight.bold, color: Color(0xffB0B1B8));

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      BlogList(),
      FavouriteView(),
      ProfileView(),
      SettingView()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: FABBottomAppBar(
        //centerItemText: 'A',
        color: AppColors.textColor,
        selectedColor: AppColors.contraBlue,
        //Color(0xff800000),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.favorite, text: 'Likes'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Profile'),
          FABBottomAppBarItem(iconData: Icons.lock, text: 'Setting'),
        ],
      ),

      // floatingActionButton: Container(
      //   margin: EdgeInsets.all(5),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: Icon(Icons.search),
      //     backgroundColor: Colors.black87,
      //   ),
      // ),

      // //floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
