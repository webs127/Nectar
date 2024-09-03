import 'package:flutter/material.dart';
import 'package:nectar/app/app.dart';
import 'package:nectar/app/local_storage.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceLocalStorage.getInstance();
  runApp(MyApp());
}
