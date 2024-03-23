
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/screens/ExtraScreens/loadingscreen.dart';

import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/provider/filmprovider.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/widgets/allfilmWidget.dart';
import 'package:loaclfilm_festivalhub_project/screens/ViewScreeningScheduleScreen/pages/schedulescreen.dart';
import 'package:provider/provider.dart';


class FilmScreen extends StatefulWidget {
  const  FilmScreen({super.key});

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
 
     @override
  void initState() {
    Provider.of<FilmProvider>(context, listen: false)
        .getAllFilmData(context: context);
   

    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final film = Provider.of<FilmProvider>(context);
   
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appbarRightColor,
        centerTitle: false,
        
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
//Icon(IconlyBold.notification,color: Colors.white,)
        ],
      ),
       drawer:  Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color:appbarRightColor),
              accountName: Text('Vishal V S',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),), accountEmail: Text('vishal123@gmail.com',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),currentAccountPicture: CircleAvatar(radius:60,backgroundImage: AssetImage('assets/profile.jpg'),)),
             ListTile(leading: Icon(Icons.dashboard),title: Text('DashBoard'),),
             InkWell(
              onTap: () { 
                Navigator.push(context,MaterialPageRoute(builder:(context)=>const ScheduleScreen()));
              },
              child: ListTile(leading: Icon(Icons.file_copy),title: Text('Film Schedule'),)),
             ListTile(leading: Icon(Icons.person),title: Text('Profile'),),
             ListTile(leading: Icon(Icons.feedback),title: Text('Feedback'),),
             ListTile(leading: Icon(Icons.logout),title: Text('Logout'),),
             

          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here...",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      prefixIcon: const Icon(IconlyLight.search),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 12),
                //   child: IconButton.filled(
                //     onPressed: () {}, icon: const Icon(IconlyLight.filter,)),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: SizedBox(
              height: 170,
              child: Card(
                color: Colors.grey.shade300,
                elevation: 0.1,
                shadowColor: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Local Film Festival Hub",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: appbarRightColor,
                                  ),
                            ),
                            const Text("Get free support from our customer service"),
                            FilledButton(
                              style: FilledButton.styleFrom(backgroundColor: appbarRightColor),
                              onPressed: () {},
                              child: const Text("Call now"),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/film.png',
                        width: 140,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Movie Lists",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See all"),
              ),
            ],
          ),
            film.loadingSpinner
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
                  : film.films.isEmpty
                      ? Center(
                          child: Text(
                          'No Films...',
                          style: TextStyle(color:Colors.black),
                        ))
                      : SizedBox(
                          height: size.height * 0.6,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.8


                              
                              ) ,
                            scrollDirection: Axis.vertical,
                            itemCount: film.films.length,
                            itemBuilder: (context, intex) {
                              return AllFilmWidget(
                                filmid: film.films[intex].filmId,
                                filmname: film.films[intex].title,
                                director: film.films[intex].director,
                                language: film.films[intex].language,
                                poster: film.films[intex].poster,
                               
                                
                              );
                            },
                          ),
                        ),          
           
         
                        
    //       GridView.builder(
    //         itemCount:  images.length,
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           childAspectRatio: 0.7,
    //           crossAxisSpacing: 16,
    //           mainAxisSpacing: 16,
    //         ),
    //         itemBuilder: (context, index) {
    //          return GestureDetector(
    //   onTap: () {
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //           builder: (_) => FilmDetailsScreen()),
    //     );
    //   },
    //   child: Card(
    //     color: Colors.black,
    //     clipBehavior: Clip.antiAlias,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: const BorderRadius.all(Radius.circular(10)),
    //       side: BorderSide(color: Colors.grey.shade200),
    //     ),
    //     elevation: 0.1,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(                                               
    //           height: 230,
             
    //           alignment: Alignment.topRight,
    //           width: double.infinity,
    //           padding: const EdgeInsets.all(8),
    //           decoration: BoxDecoration(
              
    //             image: DecorationImage(
    //               image: AssetImage(images[index]),
    //               fit: BoxFit.cover,
    //             ),   
    //           ),
            
    //         ),
           
    //       ],
    //     ),
    //   ),
    // );
    //         },
    //       )
        ],
      ),
    );
  }
}
