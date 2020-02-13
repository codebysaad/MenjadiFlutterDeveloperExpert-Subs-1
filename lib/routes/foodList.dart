import 'package:flutter/material.dart';
import 'package:meals_catalogue/layout/GirdLayout.dart';
import 'package:meals_catalogue/core/functions.dart';
import 'package:meals_catalogue/models/foodModels.dart';

class FoodList extends StatefulWidget {
  final String title;

  const FoodList({Key key, this.title = "Meals Catalogue"}) : super(key: key);
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<FoodModels> _foodList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getFood().then((v) {
      setState(() {
        _foodList = v;
      });
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,),
      ),
      body: GridList(_foodList),
    );
  }
}