import 'package:flutter/material.dart';
import 'package:flutter_navigation/view1.dart';
import 'package:flutter_navigation/view2.dart';
import 'package:flutter_navigation/view3.dart';

final routes = {
  '/view1': (BuildContext context, RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;

    return View1(
      content: args['content']!,
    );
  },
  '/view2': (BuildContext context, _) => const View2(),
  '/view3': (BuildContext context, _) => const View3(),
};
