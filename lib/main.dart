import 'package:flutter/material.dart';
import 'package:vanillacontacts_course/pages/home_page.dart';

import 'new_contact_view.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/new-contact': (context) => NewContactView(),
      },
    );
  }
}
