import 'dart:ui';
import 'package:flutter/material.dart';


class FilmCategoryScreen extends StatefulWidget {
 
  const FilmCategoryScreen({super.key});

  @override
  State<FilmCategoryScreen> createState() => _FilmCategoryScreenState();
}

class _FilmCategoryScreenState extends State<FilmCategoryScreen> {
   final List<String>names=['DRAMA','THRILLER','COMDEY','ADVENTURE','CRIME','MUSICAL','MYSTERY','ROMANCE','HORROR','ACTION']; 
 

  @override
  Widget build(BuildContext context) {
  final size=MediaQuery.of(context).size;
 
    return Scaffold(
    
      body: GridView.builder(
        itemCount:10,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/category.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child:Container(
              height: 35,
              width: 100,
             
              decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(6)),
              child: Center(child: Text(names[index],style: TextStyle(fontWeight: FontWeight.w900,color: Colors.redAccent),)),
            ),
          
          );
        },
      ));
  }
  }

