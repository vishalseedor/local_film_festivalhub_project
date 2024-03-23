import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmDetailsScreen/pages/filmdetailsscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/provider/filmprovider.dart';
import 'package:provider/provider.dart';

class AllFilmWidget extends StatefulWidget {
  final String filmid;
  final String filmname;
  final String language;
  final String director;
  final String poster;
  

  const AllFilmWidget(
      {super.key,
     required this.filmid,
     required this.filmname,
     required this.language,
     required this.director,
     required this.poster
      });

  @override
  State<AllFilmWidget > createState() => _AllFilmWidgetState();
}

class _AllFilmWidgetState extends State<AllFilmWidget > {
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final film = Provider.of<FilmProvider>(context,listen: false);
     return  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
       child: AspectRatio(
        aspectRatio: 2 / 2.2,
        child: GestureDetector(
          onTap: () {
         Navigator.of(context).pushNamed(FilmDetailsPage.routeName,arguments:widget.filmid);
          },
          child: Material(
            child: Container(
             
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.poster),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ]
                  )
                ),
                child: 
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(widget.filmname, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                ),
              ),
            ),
          ),
        ),
           ),
     );
    //  return InkWell(
    //   onTap: () {
    //       Navigator.of(context).pushNamed(FilmDetailsPage.routeName,arguments:widget.filmid);
    //   },
    //    child:Card(
        
    //     clipBehavior: Clip.antiAlias,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: const BorderRadius.all(Radius.circular(10)),
    //       side: BorderSide(color: Colors.grey.shade200),
    //     ),
    //     elevation: 1,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(                                               
    //           height: 150,
    //           alignment: Alignment.topRight,
    //           width: double.infinity,
    //           padding: const EdgeInsets.all(8),
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: NetworkImage(widget.poster),
    //               fit: BoxFit.cover,
    //             ),   
    //           ),
    //           child: SizedBox(
    //             width: 30,
    //             height: 30,
    //             child: IconButton.filledTonal(
    //               padding: EdgeInsets.zero,
    //               onPressed: () {}, 
    //               iconSize: 18,
    //               icon: const Icon(Icons.favorite_border),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.only(bottom: 6.0),
    //                 child: Text(
    //                   widget.filmname,
    //                   style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   RichText(
    //                     text: TextSpan(
    //                       children: [
    //                         TextSpan(
    //                             text: widget.director,
    //                             style:TextStyle(color: appbarRightColor,fontWeight: FontWeight.bold)),
    //                         // TextSpan(
    //                         //     text: "/${'22'}",
    //                         //     style: Theme.of(context).textTheme.bodySmall),
    //                       ],
    //                     ),
    //                   ),
    //                   // SizedBox(
    //                   //   width: 30,
    //                   //   height: 30,
    //                   //   child: IconButton.filled(
    //                   //     padding: EdgeInsets.zero,
    //                   //     onPressed: () {},
    //                   //     iconSize: 18,
    //                   //     icon: const Icon(Icons.add),
    //                   //   ),
    //                   // )
    //                 ],
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    //  );
     
    
  }
}
