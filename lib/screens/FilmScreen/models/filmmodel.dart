import 'package:flutter/material.dart';

class FilmModel {
  final String filmId;
  final String title;
  final String director;
  final String producer;
  final String screenwriter;
  final String genre;
  final String language;
  final String duration;
  final String synopsis;
  final String trailerLink;
  final String releaseYear;
  final String countryOfOrigin;
  final String cast;
  final String productionCompany;
  final String poster;
  final String comments;
  final String coordinatorId;
  final String coordinatorName;
  final String coordinatorEmail;
  final String coordinatorPhone;
  final String coordinatorPassword;
  final String coordinatorCompany;
  final String coordinatorRole;
  final String coordinatorExperience;
  final String coordinatorSkill;
  final String coordinatorPortfolio;
  final String coordinatorReferencess;
  final String agreement;
  final String coordinatorIsStatus;
  final String isFilmStatus;

  FilmModel(
      {required this.filmId,
      required this.title,
      required this.director,
      required this.producer,
      required this.screenwriter,
      required this.genre,
      required this.language,
      required this.duration,
      required this.synopsis,
      required this.trailerLink,
      required this.releaseYear,
      required this.countryOfOrigin,
      required this.cast,
      required this.productionCompany,
      required this.poster,
      required this.comments,
      required this.coordinatorId,
      required this.coordinatorName,
      required this.coordinatorEmail,
      required this.coordinatorPhone,
      required this.coordinatorPassword,
      required this.coordinatorCompany,
      required this.coordinatorRole,
      required this.coordinatorExperience,
      required this.coordinatorSkill,
      required this.coordinatorPortfolio,
      required this.coordinatorReferencess,
      required this.agreement,
      required this.coordinatorIsStatus,
      required this.isFilmStatus});

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
        filmId: json['film_id'],
        title: json['title'],
        director: json['director'],
        producer: json['producer'],
        screenwriter: json['screenwriter'],
        genre: json['genre'],
        language: json['language'],
        duration: json['duration'],
        synopsis: json['synopsis'],
        trailerLink: json['trailer_link'],
        releaseYear: json['release_year'],
        countryOfOrigin: json['country_of_origin'],
        cast: json['cast'],
        productionCompany: json['production_company'],
        poster: json['poster'],
        comments: json['comments'],
        coordinatorId: json['coordinator_id'],
        coordinatorName: json['coordinator_name'],
        coordinatorEmail: json['coordinator_email'],
        coordinatorPhone: json['coordinator_phone'],
        coordinatorPassword: json['coordinator_password'],
        coordinatorCompany: json['coordinator_company'],
        coordinatorRole: json['coordinator_role'],
        coordinatorExperience: json['coordinator_experience'],
        coordinatorSkill: json['coordinator_skill'],
        coordinatorPortfolio: json['coordinator_portfolio'],
        coordinatorReferencess: json['coordinator_referencess'],
        agreement: json['agreement'],
        coordinatorIsStatus: json['coordinator_is_status'],
        isFilmStatus: json['is_film_status']);
  }
}
