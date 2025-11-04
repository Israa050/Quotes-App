
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes/core/utils.dart';
import 'package:quotes/widgets/quote_card.dart';

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({super.key});

  @override
  State<QuoteWidget> createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> with SingleTickerProviderStateMixin  {


  static const EventChannel _eventChannel = EventChannel('com.example.shake/events');
  StreamSubscription? _subscription;
  String? _currentQuote;

  // animation
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;


 @override
  void initState() {
    super.initState();
    _subscription = _eventChannel.receiveBroadcastStream().listen(_onShakeEvent, onError: _onError);
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _offsetAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _onShakeEvent(dynamic event) {
    // event can be a string or map — we just react
    _showRandomQuote();
  }

  void _onError(Object error) {
    debugPrint('Shake event error: $error');
  }

  void _showRandomQuote() {
    final q = getRandomQuote();
    setState(() => _currentQuote = q);

    // simple animation: show a sliding card for 2s
    _controller.forward(from: 0);
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) setState(() => _currentQuote = null);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Study session active — shake the phone for a quote',style: Theme.of(context).textTheme.headlineMedium,)),
      
          SizedBox(
            height: 450,
            width: 400,
            child: Stack(
              children: [
                // Animated quote overlay
                if (_currentQuote != null)
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 100,
                    child: SlideTransition(
                      position: _offsetAnimation,
                      child: QuoteCard(quote: _currentQuote!)
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}