import "package:diatom/pages/AddDevice.dart";
import "package:diatom/pages/products/Product_detail1.dart";
import "package:diatom/pages/home.dart";
import "package:flutter/material.dart";
import "package:hidden_drawer_menu/hidden_drawer_menu.dart";

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
          baseStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0, // Set the font size
            fontWeight: FontWeight.bold, // Set the font weight
          ),
          selectedStyle: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
            fontWeight:
                FontWeight.bold, // Set the font weight for selected state
          ),
          colorLineSelected: Colors.red,
        ),
        Home(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Product1",
          baseStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          selectedStyle: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          colorLineSelected: Colors.red,
        ),
        Product1(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Product2",
          baseStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          selectedStyle: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          colorLineSelected: Colors.red,
        ),
        Product1(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "AddDevice",
          baseStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          selectedStyle: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          colorLineSelected: Colors.red,
        ),
        AddDevice(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: const Color.fromRGBO(144, 164, 174, 1),
      screens: _pages,
      initPositionSelected: 0,
      leadingAppBar: Icon(Icons.menu),
      tittleAppBar: Text(
        "DiAtom Technologies",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      isTitleCentered: true,
      backgroundColorAppBar: Color.fromARGB(255, 50, 126, 188),
    );
  }
}
