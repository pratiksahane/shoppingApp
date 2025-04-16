import 'package:flutter/material.dart';
import 'package:myapp/CartProvider.dart';
import 'package:myapp/shoepage.dart';
import 'package:provider/provider.dart';
import 'Homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(create:  (context) => CartProvider(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}



