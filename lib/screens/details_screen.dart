import 'package:flutter/material.dart';
import '../models/quote.dart';

class DetailsScreen extends StatelessWidget {
  final Quote quote;

  DetailsScreen({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quote Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              '"${quote.text}"',
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "- ${quote.author}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              quote.details,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/${quote.image}'),
          ],
        ),
      ),
    );
  }
}
