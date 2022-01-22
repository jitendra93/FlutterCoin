import 'package:flutter/material.dart';
import 'package:validus/constants.dart';
import 'package:validus/ui/profile_screen.dart';
import 'package:validus/ui/stock_screen.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  static List<String> titles = [MY_WATCHLIST,PROFILE];
  static List<Widget> pages = <Widget>[
    StockScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          titles[_selectedIndex]
          ,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: IndexedStack(
        children: pages,
        index: _selectedIndex,
      ) ,
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor:  Theme.of(context).backgroundColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: STOCKS,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: PROFILE,
          ),
        ],
      ),
    );
  }
}


