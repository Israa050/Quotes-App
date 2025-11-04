import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';


class QuoteCard extends StatelessWidget {
  final String quote;
  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.format_quote_rounded,
            color: Colors.white.withValues(alpha: 0.8),
            size: 40,
          ),
          const SizedBox(height: 12),
          Text(
            quote,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.format_quote_rounded,
              color: Colors.white.withValues(alpha: 0.8),
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
