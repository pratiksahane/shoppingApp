import 'package:flutter/material.dart';
import 'package:myapp/CartPage.dart';
import 'package:myapp/bodydata.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> filters = ["All", "Addidas", "Nike", "Beta"];
  int selected=0;
  List<Widget> pages=[Bodydata(),CartPage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex=value;
          });
        },
        items: [
        BottomNavigationBarItem(icon:Icon(Icons.home),label: "",activeIcon: Icon(Icons.home, color: Colors.amber),),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: "",activeIcon: Icon(Icons.shopping_basket, color: Colors.amber),),
      ]),
    );
  }
}

