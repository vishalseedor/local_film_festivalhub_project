import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:loaclfilm_festivalhub_project/screens/FilmScreen/models/filmmodel.dart';


class FilmProvider with ChangeNotifier {
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

 

  List<FilmModel> _films = [];
  List<FilmModel> get films {
    return [..._films];
  }

  // List<FilmModel> _searchProducts = [];
  // List<FilmModel> get searchProducts {
  //   return [..._searchProducts];
  // }

 

  Future getAllFilmData({BuildContext? context, String? value}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/view_all_film.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/view_all_film.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _films = [];
      //  _filteredProducts = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> filmDetails = extractedData['filmDetails'];
        for (var i = 0; i < filmDetails.length; i++) {
          _films.add(
            FilmModel(
              filmId: filmDetails[i]['film_id'].toString(),
              title: filmDetails[i]['title'].toString(),
              director: filmDetails[i]['director'].toString(),
              producer: filmDetails[i]['producer'].toString(),
              screenwriter: filmDetails[i]['screenwriter'].toString(),
              genre: filmDetails[i]['genre'].toString(),
              language: filmDetails[i]['language'].toString(),
              duration: filmDetails[i]['duration'].toString(),
              synopsis: filmDetails[i]['synopsis'].toString(),
              trailerLink: filmDetails[i]['trailer_link'].toString(),
              releaseYear: filmDetails[i]['release_year'].toString(),
              countryOfOrigin: filmDetails[i]['country_of_origin'].toString(),
              cast: filmDetails[i]['cast'].toString(),
              productionCompany:filmDetails[i]['production_company'].toString(),
              poster: filmDetails[i]['poster'].toString(),
              comments: filmDetails[i]['comments'].toString(),
              coordinatorId: filmDetails[i]['coordinator_id'].toString(),
              coordinatorName: filmDetails[i]['coordinator_name'].toString(),
              coordinatorEmail: filmDetails[i]['coordinator_email'].toString(),
              coordinatorPhone: filmDetails[i]['coordinator_phone'].toString(),
              coordinatorPassword: filmDetails[i]['coordinator_password'].toString(),
              coordinatorCompany: filmDetails[i]['coordinator_company'].toString(),
              coordinatorRole: filmDetails[i]['coordinator_role'].toString(),
              coordinatorExperience: filmDetails[i]['coordinator_experience'].toString(),
              coordinatorSkill: filmDetails[i]['coordinator_skill'].toString(),
              coordinatorPortfolio: filmDetails[i]['coordinator_portfolio'].toString(),
              coordinatorReferencess: filmDetails[i]['coordinator_referencess'].toString(),
              agreement: filmDetails[i]['agreement'].toString(),
              coordinatorIsStatus: filmDetails[i]['coordinator_is_status'].toString(),
              isFilmStatus: filmDetails[i]['is_film_status'].toString()

          ));
        }

        print('product details' + _films.toString());
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