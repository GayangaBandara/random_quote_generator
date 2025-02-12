import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../utils/quote_service.dart';
import 'details_screen.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QuoteService _quoteService = QuoteService();
  late Quote _currentQuote;

  @override
  void initState() {
    super.initState();
    _currentQuote = _quoteService.getRandomQuote();
  }

  void _fetchNewQuote() {
    setState(() {
      _currentQuote = _quoteService.getRandomQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Quote Generator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QuoteCard(
              quote: _currentQuote,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(quote: _currentQuote),
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _fetchNewQuote,
              child: Text("Get New Quote"),
            ),
          ],
        ),
      ),
    );
  }
}
