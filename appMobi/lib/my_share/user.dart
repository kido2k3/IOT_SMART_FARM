
import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String code;
  String name;
  String id;
  String area;
  double mixer1;
  double mixer2;
  double mixer3;
  int cycle;
  String starttime;

  User({
    required this.code,
    this.name ="",
    required this.id,
    this.area ="",
    this.mixer1 =0.0,
    this.mixer2 =0.0,
    this.mixer3 =0.0,
    this.cycle =0,
    this.starttime =""
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}