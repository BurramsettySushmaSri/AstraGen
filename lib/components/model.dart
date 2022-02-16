import 'package:flutter/material.dart';

class UserData {
  String name, dob, phone, add, time ,gender;
  UserData({required this.name, required this.phone, required this.dob, required this.add, required this.time,required this. gender});
}
class Tech
{
  String label;
  Color color;
  bool isSelected;
  Tech(this.label, this.color, this.isSelected);
}
