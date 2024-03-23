import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;
import 'package:loaclfilm_festivalhub_project/screens/FilmCategoryScreen/models/filmcategorymodel.dart';

class CategoryFilmProvider with ChangeNotifier {
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

  List<CategoryFilmModel> _category = [];
  List<CategoryFilmModel> get category {
    return [..._category];
  }

  Future getAllCategoryData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/view_category.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/view_category.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _category = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> categoryDetails = extractedData['eventDetails'];
        for (var i = 0; i < categoryDetails.length; i++) {
          _category.add(
            CategoryFilmModel(
              id:categoryDetails[i]['id'].toString(),
              categoryName: categoryDetails[i]['category_name'].toString()
             
             
            ),
          );
        }
        ;

        print('category details' + _category.toString());
        _isLoading = false;
        print('cateogory products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Pet Data is one by one loaded the pet' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
 
}