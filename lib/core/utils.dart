

import 'dart:math';

import 'package:quotes/core/quotes.dart';

String getRandomQuote(){
final rnd = Random();
    return motivationalQuotes[rnd.nextInt(motivationalQuotes.length)];
}

