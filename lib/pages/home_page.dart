import 'package:flutter/material.dart';
import 'package:trashtag_city/pages/contact_page.dart';
import 'package:trashtag_city/pages/data_page.dart';
import 'package:trashtag_city/pages/people_page.dart';
import 'package:trashtag_city/pages/stats_page.dart';
import 'package:trashtag_city/pages/test.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  List<Widget> pages = [
    DataPage(),
    StatsPage(),
    PeoplePage(),
    ContactPage()
  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Trashtag City"),
      ),
      body:  Row(

          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              elevation: 2,
              onDestinationSelected: (int index){
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,

              destinations:const <NavigationRailDestination> [
                NavigationRailDestination(
                    icon: Icon(Icons.data_saver_off_outlined),
                    label: Text("Data")
                ),
                NavigationRailDestination(
                    icon: Icon(Icons.map),
                    label: Text("Map")
                ),
                NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text("Your people")
                ),
                NavigationRailDestination(
                    icon: Icon(Icons.contact_support),
                    label: Text("Contact")
                ),
              ],
            ),
            Expanded(
                child: Center(
                  child: pages[_selectedIndex],

                )
            )
          ],
        ),

     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
