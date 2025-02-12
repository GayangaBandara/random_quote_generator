import 'dart:math';
import '../models/quote.dart';

class QuoteService {
  final List<Quote> _quotes = [
    Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs", details: "Steve Jobs was an American entrepreneur and the co-founder of Apple.", image: "author_image.jpg"),
    Quote(text: "Success is not the key to happiness. Happiness is the key to success.", author: "Albert Schweitzer", details: "Albert Schweitzer was a philosopher and physician known for his contributions to theology and humanitarian work.", image: "author_image.jpg"),

  ];

  Quote getRandomQuote() {
    final random = Random();
    return _quotes[random.nextInt(_quotes.length)];
  }
}
