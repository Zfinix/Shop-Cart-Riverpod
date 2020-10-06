import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'views/home_page.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primaryColor: Color.fromRGBO(243, 113, 95, 1),
      ),
      home: HomePage(),
    );
  }
}
