import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable{
  String userName;
  String email;
  String phoneNumber;
  String password;
  DateTime createdAt;
  User({@required this.userName, @required this.email, @required this.phoneNumber, this.password, this.createdAt});

  @override
  List<Object> get props {
    return [userName, email, phoneNumber];
  }

}