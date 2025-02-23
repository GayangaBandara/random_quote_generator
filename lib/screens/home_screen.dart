import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../utils/quote_service.dart';
import 'details_screen.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QuoteService _quoteService = QuoteService();
  late Quote _currentQuote;
  late String _selectedCategory;
  late List<String> _categories;

  @override
  void initState() {
    super.initState();
    _categories = _quoteService.getCategories();
    _selectedCategory = _categories.first; // Default category
    _currentQuote = _quoteService.getRandomQuoteByCategory(_selectedCategory);
  }

  void _fetchNewQuote() {
    setState(() {
      _currentQuote = _quoteService.getRandomQuoteByCategory(_selectedCategory);
    });
  }

  void _onCategoryChanged(String? newCategory) {
    if (newCategory != null) {
      setState(() {
        _selectedCategory = newCategory;
        _currentQuote =
            _quoteService.getRandomQuoteByCategory(_selectedCategory);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Quote Generator"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Category Dropdown
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: _onCategoryChanged,
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Quote Card
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
            // Fetch New Quote Button
            ElevatedButton(
              onPressed: _fetchNewQuote,
              child: Text("Get New Quote"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
