import 'package:flutter/material.dart';
import 'package:merchant_app/model/item.dart';
import 'package:merchant_app/theme/color.dart';
import 'package:merchant_app/views/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(item: items.first,),
        FormBuyPage.routeName: (context) => FormBuyPage(),
      },
    );
  }
}
