import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

part 'create.g.dart'; // Generated file
@HiveType(typeId: 0)
class Event extends HiveObject {
  @HiveField(0)
  final String userID;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final TimeOfDay time;

  @HiveField(4)
  final String location;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final double ticketPrice;

  @HiveField(7)
  final double totalPrice;

  Event({
    required this.userID,
    required this.name,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.ticketPrice,
    required this.totalPrice,
  });
}