import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class FilmDetailsScreen extends StatefulWidget {
  // final String id;
  const FilmDetailsScreen({super.key,

  //required this.id
  });



  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  

 

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(
        title: const Text("Film Details",style: TextStyle(fontWeight: FontWeight.w900),),
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
                image: AssetImage('assets/Q.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
          'Harry Potter',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available in tickets",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "\$${'100.00'}",
                        style: Theme.of(context).textTheme.titleLarge),
                    TextSpan(
                        text: "/${'1 ticket'}",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.yellow.shade800,
              ),
              Text(
                "${10} (192)",
              ),
              const Spacer(),
              // SizedBox(
              //   height: 30,
              //   width: 30,
              //   child: IconButton.filledTonal(
              //     padding: EdgeInsets.zero,
              //     onPressed: () {},
              //     iconSize: 18,
              //     icon: const Icon(Icons.remove),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "2 ${'hours'}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,color: Colors.red
                      ),
                ),
              ),
              // SizedBox(
              //   height: 30,
              //   width: 30,
              //   child: IconButton.filledTonal(
              //     padding: EdgeInsets.zero,
              //     onPressed: () {},
              //     iconSize: 18,
              //     icon: const Icon(Icons.add),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 20),
          Text("Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),

          Text(
"Aquamanfollows Arthur Curry, the heir to the underwater kingdom of Atlantis, as he embarks on a journey to embrace his destiny and become a hero to both land and sea. Filled with breathtaking visuals and thrilling action sequences, it's a tale of adventure, duty, and the power of acceptance:"),
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
          // Text(
          //   "Coordinator Details",
          //   style: Theme.of(context)
          //       .textTheme
          //       .titleMedium!
          //       .copyWith(fontWeight: FontWeight.bold),
          // ),
          const SizedBox(height: 10),
          // Text('Coordinator Name : ${gardenData.name}', style: Theme.of(context)
          //   .textTheme
          //   .titleMedium!
          //   .copyWith(fontWeight: FontWeight.bold),),
          //    Text('Coordinator Email : ${gardenData.email}', style: Theme.of(context)
          //   .textTheme
          //   .titleMedium!
          //   .copyWith(fontWeight: FontWeight.bold),),
          //    Text('Coordinator Phone : ${gardenData.phone}', style: Theme.of(context)
          //   .textTheme
          //   .titleMedium!
          //   .copyWith(fontWeight: FontWeight.bold),),
          //    Text('Coordinator Address : ${gardenData.address}', style: Theme.of(context)
          //   .textTheme
          //   .titleMedium!
          //   .copyWith(fontWeight: FontWeight.bold),),
          //    Text('About Coordinator : ${gardenData.aboutCoordinator}', style: Theme.of(context)
          //   .textTheme
          //   .titleMedium!
          //   .copyWith(fontWeight: FontWeight.bold),),
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
            style: FilledButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {},
              icon: const Icon(IconlyLight.bag2),
              label: const Text('Book Your Tickets'))
        ],
      ),
    );
  }
}
