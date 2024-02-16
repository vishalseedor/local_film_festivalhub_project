
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmCategoryScreen/filmcategoryscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/filmscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/ProfileScreen/profilescreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/ViewScreeningScheduleScreen/schedulescreen.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final pages = [const FilmScreen(), const FilmCategoryScreen(), const ScheduleScreen(), const ProfileScreen()];
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text('Vishal V S'), accountEmail: Text('vishal123@gmail.com'),currentAccountPicture: CircleAvatar(radius:60,backgroundImage: NetworkImage('https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3386&q=80'),)),
            ListTile(leading: Icon(Icons.person),title: Text('My Profile'),)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        leading: IconButton.filledTonal(
          color:Colors.black ,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LOCAL FILM FESTIVAL HUB",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)
            ),
            Text("Enjoy our movies", style: TextStyle(color: Colors.white,fontSize: 13))
          ],
        ),
        actions: [
          Icon(IconlyBold.notification,color: Colors.white,)
        ],
      ),
      body: pages[currentPageIndex],
    bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Colors.black,
  type: BottomNavigationBarType.fixed,
  currentIndex: currentPageIndex,
  onTap: (index) {
    setState(() {
      currentPageIndex = index;
    });
  },
  selectedLabelStyle: TextStyle(color: Colors.white), 
  unselectedLabelStyle: TextStyle(color: Colors.white),// Set the color for the selected label text
  items: const [
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Icon(IconlyLight.home,color: Colors.white,),
      label: "",
      activeIcon: Icon(IconlyBold.home,color: Colors.white,),
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.category,color: Colors.white,),
      label: "",
      activeIcon: Icon(IconlyBold.category,color: Colors.white,),
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.paperFail,color: Colors.white,),
      label: "",
      activeIcon: Icon(IconlyBold.paperFail,color: Colors.white,),
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.profile,color: Colors.white,),
      label: "",
      activeIcon: Icon(IconlyBold.profile,color: Colors.white,),
    ),
  ],
),

    );
  }
}
