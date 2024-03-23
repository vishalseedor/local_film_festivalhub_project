import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/Helpers/Colors.dart/colors.dart';
import 'package:loaclfilm_festivalhub_project/screens/ExtraScreens/loadingscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/ViewScreeningScheduleScreen/provider/viewscheduleprovider.dart';
import 'package:loaclfilm_festivalhub_project/screens/ViewScreeningScheduleScreen/widgets/allscreenschedule.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
    static const routeName = 'schedule_screen';
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
     @override
  void initState() {
    Provider.of<ViewScreenScheduleProvider>(context, listen: false)
        .getAllViewScheduleData(context: context);
   

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final screenschedule=Provider.of<ViewScreenScheduleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appbarRightColor,
        title: Text('Screening Schedule',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body:Column(
        children: [
           screenschedule.loadingSpinner
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
                  : screenschedule.filmeschedule.isEmpty
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
                            itemCount: screenschedule.filmeschedule.length,
                            itemBuilder: (context, intex) {
                              return AllScreenSCheduleWidget(
                                id: screenschedule.filmeschedule[intex].id,
                                 filmid: screenschedule.filmeschedule[intex].filmId,
                                  starttime: screenschedule.filmeschedule[intex].startTime,
                                   endtime: screenschedule.filmeschedule[intex].endTime,
                                    screentype: screenschedule.filmeschedule[intex].screeningType,
                                     screeningdate: screenschedule.filmeschedule[intex].screeningDate,
                                     screenstatus: screenschedule.filmeschedule[intex].screeningStatus,
                                      createdate: screenschedule.filmeschedule[intex].createdAt);
                            },
                          ),
                        ),          

        ],
      ),
    );
  }
}