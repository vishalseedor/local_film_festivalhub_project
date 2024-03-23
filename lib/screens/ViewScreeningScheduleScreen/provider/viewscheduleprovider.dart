import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:loaclfilm_festivalhub_project/screens/ViewScreeningScheduleScreen/models/viewscreenmodel.dart';



class ViewScreenScheduleProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

 

  List<ViewScheduleScreenModel> _filmeschedule = [];
  List<ViewScheduleScreenModel> get filmeschedule  {
    return [..._filmeschedule ];
  }

  Future getAllViewScheduleData({BuildContext? context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/view_screening_schedule.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/view_screening_schedule.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
      _filmeschedule=[];
      //  _filteredProducts = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> eventDetails = extractedData['eventDetails'];
        for (var i = 0; i < eventDetails.length; i++) {
          _filmeschedule.add(
            ViewScheduleScreenModel(
              id: eventDetails[i]['id'].toString(),
              filmId: eventDetails[i]['film_id'].toString(),
              eventId: eventDetails[i]['event_id'].toString(),
              startTime: eventDetails[i]['start_time'].toString(),
              endTime: eventDetails[i]['end_time'].toString(),
              screeningType: eventDetails[i]['screening_Type'].toString(),
              screeningStatus: eventDetails[i]['screening_status'].toString(),
              screeningDate: eventDetails[i]['screening_date'].toString(),
              createdAt: eventDetails[i]['created_at'].toString()


           

          ));
        }

        print('product details' + _filmeschedule.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }

}