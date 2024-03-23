import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/provider.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/routes.dart';
import 'package:loaclfilm_festivalhub_project/screens/LoginScreen/loginscreen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:multiprovider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pet Adoption Center',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: appbarRightColor),
          useMaterial3: true,
        ),
        home: const LoginPage(),
        routes: customRoutes
          
          
      ),
    );
  }
}
