import 'package:flutter/material.dart';
class FilmEventDetails {
  final String id;
  final String eventName;
  final String eventDate;
  final String eventTime;

  FilmEventDetails({required this.id, required this.eventName,required this.eventDate, required this.eventTime});

 factory FilmEventDetails.fromJson(Map<String, dynamic> json) {
  return FilmEventDetails(
    id: json['id'] ,
     eventName:  json['event_name'],
      eventDate:json['event_date'],
       eventTime:json['event_time']);
   
  }}