import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmCategoryScreen/provider/categoryfilmprovider.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmCategoryScreen/widget/allcategoryfilmwidget.dart';
import 'package:provider/provider.dart';

class FilmCategoryScreen extends StatefulWidget {
   static const routeName = 'category_screen';
  const FilmCategoryScreen({super.key});

  @override
  State<FilmCategoryScreen> createState() => _FilmCategoryScreenState();
}

class _FilmCategoryScreenState extends State<FilmCategoryScreen> {
     @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<CategoryFilmProvider>(context, listen: false)
        .getAllCategoryData(context: context);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final filmcategory = Provider.of<CategoryFilmProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appbarRightColor,
        title: Text('Film Categories',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: filmcategory.loadingSpinner
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoadingScreen(title: 'Loading'),
                  CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )
            : filmcategory.category.isEmpty
                ? Center(
                    child: Text(
                    'No Categories...',
                    style: TextStyle(color: Colors.black),
                  ))
                : SizedBox(
                    //height: size.height * 0.2,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30),
                      scrollDirection: Axis.vertical,
                      itemCount: filmcategory.category.length,
                      itemBuilder: (context, intex) {
                        return AllCategoryFilmWidget(
                          id: filmcategory.category[intex].id,
                          categoryname: filmcategory.category[intex].categoryName,
                        );
                      },
                    ),
                  ),
      ),

      // body: GridView.builder(
      //   itemCount:10,
      //   padding: const EdgeInsets.all(20),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 0.85,
      //     crossAxisSpacing: 30,
      //     mainAxisSpacing: 30,
      //   ),
      //   itemBuilder: (context, index) {
      //     return Container(
      //       alignment: Alignment.center,
      //       padding: const EdgeInsets.all(10),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //         image: DecorationImage(
      //           image: AssetImage('assets/category.jpg'),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       child:Container(
      //         height: 35,
      //         width: 100,

      //         decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(6)),
      //         child: Center(child: Text(names[index],style: TextStyle(fontWeight: FontWeight.w900,color: Colors.redAccent),)),
      //       ),

      //     );
      //   },
      // )
    );
  }
}
