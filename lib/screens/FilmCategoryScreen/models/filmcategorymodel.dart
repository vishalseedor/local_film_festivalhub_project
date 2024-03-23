import 'package:flutter/material.dart';

class CategoryFilmModel {
  final String id;
  final String categoryName;

  CategoryFilmModel({required this.id,required this.categoryName});

  factory CategoryFilmModel.fromJson(Map<String, dynamic> json) {
    return CategoryFilmModel(
      id: json['id'],
      categoryName:json['category_name']);
  }}