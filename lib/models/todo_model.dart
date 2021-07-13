import 'package:flutter/cupertino.dart';

class Todo {
  late String id;
  String title;
  String description;
  bool status;

  Todo({required this.title, required this.description, this.status = false}) {
    id = UniqueKey().toString();
  }
}
