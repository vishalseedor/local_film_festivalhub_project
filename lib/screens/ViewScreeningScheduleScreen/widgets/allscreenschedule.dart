
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';



class AllScreenSCheduleWidget extends StatefulWidget {
  final String id;
  final String filmid;
  final String starttime;
  final String endtime;
  final String screentype;
  final String screeningdate;
  final String createdate;
  final String screenstatus;

  
  const AllScreenSCheduleWidget({
    required this.id,
    required this.filmid,
    required this.starttime,
    required this.endtime,
    required this.screentype,
    required this.screeningdate,
    required this.createdate,
    required this.screenstatus,
    Key? key
    
   
  }) : super(key: key);


 

  @override
  State<AllScreenSCheduleWidget> createState() => _AllScreenSCheduleWidgetState();
}

class _AllScreenSCheduleWidgetState extends State<AllScreenSCheduleWidget> {
 
  
  File? file;
  bool isLoading = false;
 
 
  @override
  Widget build(BuildContext context) {
       final size = MediaQuery.of(context).size;
   

   

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        
        alignment: Alignment.topRight,
        children: [
         GestureDetector(
          onTap: () {
            // Navigator.of(context)
            //     .pushNamed(PayslipDetailsScreen.routeName, arguments: {
            //   'id': paySlip.id,
            //   'lineIds': paySlip.lineId,
            // });
          },
          child: Card(
            color: Colors.grey[200],
            elevation:7,
            shape:RoundedRectangleBorder(borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topLeft: Radius.circular(20)),side:BorderSide(color: appBarLeftColor,width: 0)),
            margin: const EdgeInsets.all(19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading:CircleAvatar(radius: 25,backgroundColor:Colors.white
                  ,
                  child: Image.asset('assets/q.png',
                  width: 30,
                  height: 30,
                  ),
                  ),
                  
                  // Image.asset(
                  //   payslipIcon,
                  //   width: 35,
                  //   height: 35
                  // ),
                  title: Text('Screen Schedule',style:const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('Film Id ${widget.filmid}',style: TextStyle(fontWeight: FontWeight.bold,color:appbarRightColor),),
                
                ),
             
                Container(
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: appBarLeftColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.screentype,style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(width: size.width*0.02),
                       Text('(${widget.screeningdate})'.substring(0,12),style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height*0.03,
                        width: size.width*0.20,
                        decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: GreyColor) ,
                        child: Center(child: Text(widget.starttime,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),))),
                      Container(
                        height: size.height*0.03,
                        width: size.width*0.20,
                        decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: GreyColor) ,
                        child: Center(child: Text(widget.endtime,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 12)))),
                    ],
                  ),
                ),
                   ],
  
            ),
            
          ),
  
        ),
  
        Container(
             height: size.height * 0.03,
            width: size.width * 0.3,
            margin:  EdgeInsets.only(right: size.width*0.04),
            decoration: BoxDecoration(
                color: appbarRightColor,
                borderRadius:const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                   // bottomLeft: Radius.circular(10)
                    )),
                    child: Center(child: Text(widget.screenstatus,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),),

        )
        ],
      ),
    );
  }
}
