





import 'package:loaclfilm_festivalhub_project/screens/FilmCategoryScreen/provider/categoryfilmprovider.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmEventScreen/provider/filmevntprovider.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/provider/filmprovider.dart';
import 'package:loaclfilm_festivalhub_project/screens/ViewScreeningScheduleScreen/provider/viewscheduleprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => FilmProvider()),
  ChangeNotifierProvider(create: (context)=>FilmEventProvider()),
  ChangeNotifierProvider(create: (context)=>CategoryFilmProvider()),
  ChangeNotifierProvider(create: (context)=>ViewScreenScheduleProvider())
];
