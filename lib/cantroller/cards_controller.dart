import 'package:cardsimtixon/model/cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardsController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List listofcards = [];
  bool isLoading = true;
  bool isSaveLoading = false;
  QuerySnapshot? res;

  getCategory() async {
    isLoading = true;
    notifyListeners();
    res = await firestore.collection("Cards").get();
    listofcards.clear();
    // ignore: avoid_function_literals_in_foreach_calls
    res?.docs.forEach((element) {
      listofcards.add(Cards(
          name: element['Name'],
          cvv: element['Cvv'],
          number: element['Number'],
          data: element['data'],
          Type: element['Type']));
    });
    isLoading = false;
    notifyListeners();
  }

  createProduct({
    required String name,
    required int cvv,
    required String number,
    required String data,
    required String type,
  }) async {
    isLoading = true;
    notifyListeners();
    await firestore.collection("Cards").add(
        Cards(name: name, cvv: cvv, number: number, data: data, Type: type)
            .tojson());
    isLoading = false;
    notifyListeners();
  }
}
