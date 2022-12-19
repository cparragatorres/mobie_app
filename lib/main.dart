import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobie_app/pages/home_page.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}
