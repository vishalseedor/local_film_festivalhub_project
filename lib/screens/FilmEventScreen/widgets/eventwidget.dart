import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/provider/filmprovider.dart';
import 'package:provider/provider.dart';

class AllEventWidget extends StatefulWidget {
  final String id;
  final String eventname;
  final String evnetdate;
  final String eventtime;
 
  

  const AllEventWidget(
      {super.key,
     required this.id,
     required this.eventname,
     required this.evnetdate,
     required this.eventtime,
     
      });

  @override
  State<AllEventWidget > createState() => _AllEventWidgetState();
}

class _AllEventWidgetState extends State<AllEventWidget> {
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final film = Provider.of<FilmProvider>(context,listen: false);
     return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                        
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            color: Colors.grey[200],
                            margin: const EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                     
                                     
                                      Text(
                                        widget.eventname,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Time : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                      Text(widget.eventtime,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: darkgreyColor,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: size.height * 0.03,
                                          width: size.width * 0.32,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(40),
                                                topRight: Radius.circular(40)),
                                            color: Colors.white,
                                          ),
                                          child: const Center(
                                              child: Text(
                                            'Date :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.2),
                                          child: Text(
                                            widget.evnetdate,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
     
    
  }
}
