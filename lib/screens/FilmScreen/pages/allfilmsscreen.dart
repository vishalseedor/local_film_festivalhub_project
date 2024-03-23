import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/screens/ExtraScreens/errorscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/provider/filmprovider.dart';
import 'package:provider/provider.dart';


class AllFilmsScreen extends StatefulWidget {
  static const routeName = 'all_films_screen';

  const AllFilmsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllFilmsScreen> createState() => _AllFilmsScreenState();
}

class _AllFilmsScreenState extends State<AllFilmsScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<FilmProvider>(context, listen: false)
        .getAllFilmData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final film= Provider.of<FilmProvider>(context);
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
        body: film.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : film.isError
                ? ErrorScreen(title: film.isError.toString())
                : film.films.isEmpty
                    ? const Text(
                        'No Films',
                      )
                    : film.films.isEmpty
                        ? const Center(child: Text("No Films"))
                        : ListView.builder(
                            itemCount: film.films.length,
                            itemBuilder: (ctx, index) {
                              print(film.films.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
