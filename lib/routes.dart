import 'package:flutter/material.dart';
import 'package:flutter_navigation/view1.dart';
import 'package:flutter_navigation/view2.dart';
import 'package:flutter_navigation/view3.dart';

final routes = {
  '/view1': (BuildContext context) => const View1(),
  '/view2': (BuildContext context) => const View2(),
  '/view3': (BuildContext context) => const View3(),
};
