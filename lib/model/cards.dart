// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cards {
  final String name;
  final int cvv;
  final String number;
  final String data;
  // ignore: non_constant_identifier_names
  final String Type;
  final String id;


  Cards( 
      {required this.name,
      required this.id,
      required this.cvv,
      required this.number,
      required this.data,
      // ignore: non_constant_identifier_names
      required this.Type});
  factory Cards.fromJson(Map? datas,String id) {
    return Cards(
        name: datas?["Name"],
        cvv: datas?['Cvv'],
        number: datas?['Number'],
        data: datas?['data'],
        Type: datas?['Type'], id: id);
  }

  tojson() {
    return {
      'Name': name,
      'Cvv': cvv,
      'Number': number,
      'data': data,
      'Type': Type,
    };
  }
}
