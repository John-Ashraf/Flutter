import 'package:flutter/material.dart';

import 'Widgets/exxpenses.dart';

void main() {
  runApp(const MyApp());
}
var myColorScheme=ColorScheme.fromSeed(seedColor:
const Color.fromARGB(255, 59, 96, 179),
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  ThemeData().copyWith(
        useMaterial3: true,
       colorScheme: myColorScheme,
       appBarTheme: AppBarTheme().copyWith(
         backgroundColor: myColorScheme.onPrimaryContainer,
         foregroundColor: myColorScheme.primaryContainer
       ),
        cardTheme: CardTheme().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
        ),elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: myColorScheme.primaryContainer
        ),

      )

      ),
      home: const Expenses(),
    );
  }
}


