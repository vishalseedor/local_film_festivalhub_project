import 'package:flutter/material.dart';

class ViewScheduleScreenModel {
  final String  id;
  final String  filmId;
  final String  eventId;
  final String  startTime;
  final String  endTime;
  final String  screeningType;
  final String  screeningStatus;
  final String  screeningDate;
  final String  createdAt;

  ViewScheduleScreenModel(
      {required this.id,
      required this.filmId,
      required this.eventId,
      required this.startTime,
      required this.endTime,
      required this.screeningType,
      required this.screeningStatus,
      required this.screeningDate,
      required this.createdAt});

 factory ViewScheduleScreenModel.fromJson(Map<String, dynamic> json) {
  return ViewScheduleScreenModel(
    id:json['id'],
     filmId:json['film_id'],
      eventId:json['event_id'],
       startTime: json['start_time'],
        endTime:  json['end_time'],
         screeningType: json['screening_Type'],
          screeningStatus: json['screening_status'],
           screeningDate:json['screening_date'],
            createdAt: json['created_at']);
   
  }}