import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting/provider/provider_notifer.dart';

import 'login/login_screen.dart';
import 'network/dio_helper.dart';

void main() {
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sorting App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
