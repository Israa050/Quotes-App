import 'package:flutter/material.dart';
import 'package:quotes/core/app_theme.dart';
import 'package:quotes/widgets/quote_widget.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes',
      theme: appTheme,
      home: const MyHomePage(title: 'Motivational Quotes'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title,style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: QuoteWidget()
    );
  }
}
