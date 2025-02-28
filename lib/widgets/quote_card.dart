import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback onTap;

  const QuoteCard({super.key, required this.quote, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color.fromARGB(108, 15, 15, 15), Color.fromARGB(255, 85, 124, 136)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.format_quote, size: 36, color: Colors.white70),
              const SizedBox(height: 10),
              Text(
                '"${quote.text}"',
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.white70, thickness: 1, indent: 40, endIndent: 40),
              const SizedBox(height: 8),
              Text(
                "- ${quote.author}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
