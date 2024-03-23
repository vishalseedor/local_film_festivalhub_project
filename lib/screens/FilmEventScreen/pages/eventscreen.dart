import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmEventScreen/provider/filmevntprovider.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmEventScreen/widgets/eventwidget.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
    @override
  void initState() {
    Provider.of<FilmEventProvider>(context, listen: false)
        .getAllEventFilmData(context: context);
   

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final filmevent=Provider.of<FilmEventProvider>(context);
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:appbarRightColor,
        title: const Text('Fiilm Events',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
        
      ),
      body: Column(
        children: [
           filmevent.loadingSpinner
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
                  : filmevent.filmevents.isEmpty
                      ? Center(
                          child: Text(
                          'No Films...',
                          style: TextStyle(color:Colors.black),
                        ))
                      : SizedBox(
                          height: size.height * 0.6,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: filmevent.filmevents.length,
                            itemBuilder: (context, intex) {
                              return AllEventWidget(
                                id: filmevent.filmevents[intex].id,
                                eventname: filmevent.filmevents[intex].eventName,
                                eventtime: filmevent.filmevents[intex].eventTime,
                                evnetdate: filmevent.filmevents[intex].eventDate,

                              );
                            },
                          ),
                        ),          

        ],
      ),
    );
  }
}