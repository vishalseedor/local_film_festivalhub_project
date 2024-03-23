
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmCategoryScreen/pages/filmcategoryscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmEventScreen/pages/eventscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/pages/filmscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/ProfileScreen/profilescreen.dart';



class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final pages = [const FilmScreen(), const FilmCategoryScreen(), const EventScreen(), ProfileScreen()];
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
     
      body: pages[currentPageIndex],
    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: appbarRightColor,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme:IconThemeData(color: Colors.grey),
 // backgroundColor:appbarRightColor,
  type: BottomNavigationBarType.fixed,
  currentIndex: currentPageIndex,
  onTap: (index) {
    setState(() {
      currentPageIndex = index;
    });
  },
  selectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), 
  unselectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),// Set the color for the selected label text
  items:  [
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: Icon(Icons.home,color: Colors.grey,),
      label: "Home",
      activeIcon: Icon(Icons.home_outlined,color:appbarRightColor),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.category,color: Colors.grey,),
      label: "Category",
      activeIcon: Icon(Icons.category_outlined,color:appbarRightColor),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event,color:  Colors.grey,),
      label: "Events",
      activeIcon: Icon(Icons.event_outlined,color: appbarRightColor),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person,color: Colors.grey,),
      label: "Profile",
      activeIcon: Icon(Icons.person_outline,color:appbarRightColor),
    ),
  ],
),

    );
  }
}
