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

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final QuoteService _quoteService = QuoteService();
  late Quote _currentQuote;
  late String _selectedCategory;
  late List<String> _categories;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _categories = _quoteService.getCategories();
    _selectedCategory = _categories.first;
    _currentQuote = _quoteService.getRandomQuoteByCategory(_selectedCategory);

    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _fadeController.forward();
  }

  void _fetchNewQuote() {
    setState(() {
      _fadeController.reset();
      _currentQuote = _quoteService.getRandomQuoteByCategory(_selectedCategory);
      _fadeController.forward();
    });
  }

  void _onCategoryChanged(String? newCategory) {
    if (newCategory != null) {
      setState(() {
        _selectedCategory = newCategory;
        _fetchNewQuote();
      });
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inspirational Quotes",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFE0F7FA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Select Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    onChanged: _onCategoryChanged,
                    underline: Container(),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.teal),
                    style: const TextStyle(color: Colors.black87, fontSize: 18),
                    items: _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                // Quote Card with Fade-in Animation
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: QuoteCard(
                    quote: _currentQuote,
                    authorCentered: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(quote: _currentQuote),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                // "Get New Quote" Button
                ElevatedButton(
                  onPressed: _fetchNewQuote,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    elevation: 8,
                  ),
                  child: const Text("Inspire Me"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}