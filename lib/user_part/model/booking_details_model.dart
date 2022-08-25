import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingDetailsModel {
  final String uid;
   String orderStoredId;
  final String name;
  final String email;
  final String phoneNumber;
  final int tableSize;
  final DateTime date;
  final Timestamp arrivalTime;

  BookingDetailsModel({
    required this.uid,
    required this.orderStoredId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.tableSize,
    required this.date,
    required this.arrivalTime,
  });

  Map<String, dynamic> modelToJson() => {
        'useId': uid,
        'orderStoredId': orderStoredId,
        'userName': name,
        'emailAddress': email,
        'phoneNumber': phoneNumber,
        'tableSize': tableSize,
        'date': date,
        'arrivalTime': arrivalTime
      };
}
