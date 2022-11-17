import 'package:flutter/material.dart';

const TextStyle smText =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

BoxDecoration gradientdecoration_YR = BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.orange.shade300, Colors.red.shade300],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

BoxDecoration gradientdecoration_PP = const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFFF65A61), Color(0xFFF65A61)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black87,
        blurRadius: 3.0,
        spreadRadius: 3.0,
        offset: Offset(2, 6), // shadow direction: bottom right
      )
    ]);
