import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';

class AllCategoryFilmWidget extends StatefulWidget {
  final String id;
  final String categoryname;
  const AllCategoryFilmWidget({super.key,required this.id,required this.categoryname});

  @override
  State<AllCategoryFilmWidget> createState() => _AllCategoryFilmWidgetState();
}

class _AllCategoryFilmWidgetState extends State<AllCategoryFilmWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/cate.png'),
                fit: BoxFit.cover,
              ),
            ),
            child:Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 35,
                width: 100,
               
                decoration: BoxDecoration( color: appbarRightColor,borderRadius: BorderRadius.circular(6)),
                child: Center(child: Text(widget.categoryname,style: const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),)),
              ),
            ),
          
          );
  }
}