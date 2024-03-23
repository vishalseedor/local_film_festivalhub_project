import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/screens/ExtraScreens/errorscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmEventScreen/provider/filmevntprovider.dart';
import 'package:provider/provider.dart';


class AllEvnetsScreen extends StatefulWidget {
  static const routeName = 'all_events_screen';

  const AllEvnetsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllEvnetsScreen> createState() => _AllEvnetsScreenState();
}

class _AllEvnetsScreenState extends State<AllEvnetsScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<FilmEventProvider>(context, listen: false)
        .getAllEventFilmData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final filmevent= Provider.of<FilmEventProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Films',
                style: TextStyle(fontSize: 14),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        body: filmevent.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            :filmevent.isError
                ? ErrorScreen(title:filmevent.isError.toString())
                : filmevent.filmevents.isEmpty
                    ? const Text(
                        'No Films',
                      )
                    :filmevent.filmevents.isEmpty
                        ? const Center(child: Text("No Films"))
                        : ListView.builder(
                            itemCount:filmevent.filmevents.length,
                            itemBuilder: (ctx, index) {
                              print(filmevent.filmevents.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
