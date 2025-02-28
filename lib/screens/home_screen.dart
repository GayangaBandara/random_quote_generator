import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../utils/quote_service.dart';
import 'details_screen.dart';
import '../widgets/quote_card.dart';
import '../widgets/constants.dart'; 

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.gradientPrimary,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  "Inspirational Quotes",
                  style: TextStyle(
                    fontFamily: 'Lora', // Use the custom font here
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Select Category",
                        style: TextStyle(
                          fontFamily: 'Lora', // Use the custom font here
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: DropdownButton<String>(
                          value: _selectedCategory,
                          onChanged: _onCategoryChanged,
                          underline: Container(),
                          icon: const Icon(Icons.arrow_drop_down, color: AppColors.secondary),
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
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: QuoteCard(
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
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _fetchNewQuote,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.textPrimary,
                          backgroundColor: AppColors.secondary,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          elevation: 8,
                        ),
                        child: const Text("Generate"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
