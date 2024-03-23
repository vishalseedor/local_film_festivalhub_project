import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:loaclfilm_festivalhub_project/screens/FilmEventScreen/models/filmeventmodel.dart';



class FilmEventProvider with ChangeNotifier {
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

 

  List<FilmEventDetails> _filmevnts = [];
  List<FilmEventDetails> get filmevents {
    return [..._filmevnts];
  }

  Future getAllEventFilmData({BuildContext? context, String? value}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/view_event.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/view_event.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _filmevnts = [];
      //  _filteredProducts = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> eventDetails = extractedData['eventDetails'];
        for (var i = 0; i < eventDetails.length; i++) {
          _filmevnts.add(
            FilmEventDetails(
              id: eventDetails[i]['id'].toString(),
              eventName: eventDetails[i]['event_name'].toString(),
              eventTime: eventDetails[i]['event_time'].toString(),
              eventDate: eventDetails[i]['event_date'].toString(),
          

          ));
        }

        print('product details' + _filmevnts.toString());
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