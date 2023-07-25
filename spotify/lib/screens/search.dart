// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
        'Search',
        style: TextStyle(fontSize: 40, color: Colors.yellowAccent),
      ),
    );
  }
}
