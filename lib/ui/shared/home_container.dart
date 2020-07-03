// import 'package:news_api/ui/views/home_view.dart';
import 'package:flutter/material.dart';

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
      // HomeView(),
      // OrderView(),
      // AccountView()
      Text(
        'Index 2: careers',
        style: _textStyle,
      ),
      Text(
        'Index 2: careers',
        style: _textStyle,
      ),
      Text(
        'Index 3: Appliications',
        style: _textStyle,
      ),
      Text(
        'Index 4: Profile',
        style: _textStyle,
      ),
    ];
    return Scaffold(
      body: Container(
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: FABBottomAppBar(
        //centerItemText: 'A',
        color: Color(0xff371821),
        selectedColor: AppColors.primaryColor, //Color(0xff800000),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.list, text: 'careers'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'applications'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'profile'),
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