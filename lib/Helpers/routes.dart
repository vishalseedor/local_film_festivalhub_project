import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmCategoryScreen/pages/filmcategoryscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmDetailsScreen/pages/filmdetailsscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/pages/allfilmsscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/ViewScreeningScheduleScreen/pages/schedulescreen.dart';


var customRoutes = <String, WidgetBuilder>{
    'all_films_screen': (context) => const AllFilmsScreen(),
    'all_events_screen':(context) => const AllFilmsScreen(),
    'film_details_screen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return FilmDetailsPage(
           id: id,
    );
  },
   'category_screen':(context) => const FilmCategoryScreen(),
   'schedule_screen':(context) => const ScheduleScreen()


};