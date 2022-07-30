import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_fire/screens/home_screen.dart';
import 'package:get_storage/get_storage.dart';
void main() async{
 await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
