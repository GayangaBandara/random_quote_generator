import 'package:flutter/material.dart';
import '../models/quote.dart';

class DetailsScreen extends StatelessWidget {
  final Quote quote;

  const DetailsScreen({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote Details"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              '"${quote.text}"',
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "- ${quote.author}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            SizedBox(height: 40),
            Text(
              quote.details,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/${quote.image}'),
          ],
        ),
      ),
    );
  }
}