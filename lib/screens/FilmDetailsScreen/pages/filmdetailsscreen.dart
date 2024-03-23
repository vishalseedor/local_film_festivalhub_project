

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/provider/filmprovider.dart';
import 'package:provider/provider.dart';


class FilmDetailsPage extends StatefulWidget {
static const routeName = 'film_details_screen';
  final String id;
  const FilmDetailsPage({super.key,
  required this.id});



  @override
  State<FilmDetailsPage> createState() => _FilmDetailsPageState();
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
  

  // late TapGestureRecognizer readMoreGestureRecognizer;
  // bool showMore = false;

  // @override
  // void initState() {
  //   super.initState();
  //   readMoreGestureRecognizer = TapGestureRecognizer()
  //     ..onTap = () {
  //       setState(() {
  //         showMore = !showMore;
  //       });
  //     };
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   readMoreGestureRecognizer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
      final film = Provider.of<FilmProvider>(context,listen: false);
      final filmData =
        Provider.of<FilmProvider>(context).films.firstWhere((element) => element.filmId == widget.id);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appbarRightColor,
        title: const Text("Film Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.bookmark),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 350,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(filmData.poster),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            filmData.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
    
      
         
          const SizedBox(height: 10),
          Row(
            children: [
             Text('Year :',   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                   fontWeight: FontWeight.bold,color: appbarRightColor
                 ),),
              Text(
                "${filmData.releaseYear}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                   fontWeight: FontWeight.bold,color: appbarRightColor
                 ),
              ),
              //const Spacer(),
             
             
             
            ],
          ),
           Text(
             "Cast :  ${filmData.cast}",
             style: Theme.of(context).textTheme.titleMedium!.copyWith(
                   fontWeight: FontWeight.bold,color: appbarRightColor
                 ),
           ),
          const SizedBox(height: 20),
          Text("Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),

          Text(filmData.comments),
          // RichText(
          //   text: TextSpan(
          //     style: Theme.of(context).textTheme.bodyMedium,
          //     children: [
          //       TextSpan(
          //         text: showMore
          //             ? gardenData.description
          //             : '${gardenData.description.substring(0, gardenData.description.length - 100)}...',
          //       ),
          //       TextSpan(
          //         recognizer: readMoreGestureRecognizer,
          //         text: showMore ? " Read less" : " Read more",
          //         style: TextStyle(
          //           color: Theme.of(context).colorScheme.primary,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),
          Text(
            "Coordinator Details :",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold,color: appbarRightColor),
          ),
          const SizedBox(height: 10),
          Text('Coordinator Name : ${filmData.coordinatorName}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
             Text('Coordinator Email : ${filmData.coordinatorEmail}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
             Text('Coordinator Phone : ${filmData.coordinatorPhone}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
             Text('Coordinator Address : ${filmData.coordinatorCompany}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
             Text('About Coordinator : ${filmData.coordinatorExperience}', style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),),
          // SizedBox(
          //   height: 90,
          //   child: ListView.separated(
          //     physics: const BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         height: 90,
          //         width: 80,
          //         margin: const EdgeInsets.only(bottom: 16),
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: NetworkImage(gardenData.photo),
          //             fit: BoxFit.cover,
          //           ),
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //       );
          //     },
          //     separatorBuilder: (__, _) => const SizedBox(
          //       width: 10,
          //     ),
          //     itemCount: garden.gardens.length,
          //   ),
          // ),
          const SizedBox(height: 20),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(IconlyLight.ticket),
              label: const Text("Book your Ticket",style: TextStyle(fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
