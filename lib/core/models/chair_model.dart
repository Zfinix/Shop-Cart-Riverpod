import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChairModel with EquatableMixin {
  String name;
  String price;
  String image;
  int quantity;
  final String id = Random().nextInt(1000).toString();

  ChairModel({
    @required this.name,
    @required this.price,
    @required this.image,
    this.quantity = 0,
  });

  @override
  List<Object> get props => [name, price, image, quantity];
}
