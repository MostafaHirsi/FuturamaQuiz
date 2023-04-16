import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Person with ChangeNotifier {
  Person({required this.name, required this.age});

  String name;
  int age;

  void increaseAge() {
    this.age++;
    notifyListeners();
  }

  void changeName(name) {
    this.name = name;
    notifyListeners();
  }
}

final personProvider = ChangeNotifierProvider<Person>((ref) {
  return Person(age: 0, name: "");
});
