import 'package:flutter/material.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/screens/home_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/side_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _selectedScreenIndex = 0;

  final List<Meal> fav = [];

  void _setFavourite(Meal meal) {
    final check = fav.contains(meal);

    if (check) {
      setState(() {
        fav.remove(meal);
      });
    } else {
      setState(() {
        fav.add(meal);
      });
    }
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget current = HomeScreen(ontogglefav1: _setFavourite);
    var nam = "Categories";

    if (_selectedScreenIndex == 1) {
      current = Meals(
          categoryTitle: "Favourites", meals: fav, ontogglefav: _setFavourite);
      nam = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(nam),
      ),
      drawer: const Drawerwidget(),
      body: current,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          currentIndex: _selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Favourites"),
          ]),
    );
  }
}
