import 'dart:math';
import '../models/quote.dart';

class QuoteService {
  final List<Quote> _quotes = [
    Quote(
        text: "Life is what happens when you're busy making other plans.",
        author: "John Lennon",
        details:
            "John Lennon fue un influyente músico, compositor y activista británico, conocido principalmente por ser el fundador y co-vocalista de The Beatles, una de las bandas más icónicas del siglo XX. Desde joven, mostró interés por la música y formó la banda The Quarrymen en 1956, la cual evolucionó hasta convertirse en The Beatles en 1960. Junto a Paul McCartney, escribió algunas de las canciones más famosas de la historia, consolidándose como una de las duplas de compositores más exitosas. Tras la separación del grupo en 1970, Lennon continuó su carrera como solista, lanzando álbumes como *Imagine*, cuyas canciones reflejaban su visión pacifista y su deseo de un mundo sin violencia. \n \n ""En su vida personal, Lennon tuvo una estrecha relación con la artista Yoko Ono, con quien se casó en 1969 y adoptó el nombre de John Ono Lennon. Durante la década de 1970, se alejó temporalmente de la música para dedicarse a su familia, regresando en 1980 con el álbum *Double Fantasy*. Sin embargo, su vida se vio trágicamente interrumpida cuando fue asesinado el 8 de diciembre de ese mismo año por Mark David Chapman, un fan obsesionado con él. Su legado sigue vivo a través de su música y su mensaje de paz, influyendo en generaciones de artistas y seguidores en todo el mundo.",
        image: "author_image1.jpg",
        category: "Life"),
    Quote(
        text: "Get busy living or get busy dying.",
        author: "Stephen King",
        details:
            "Stephen King is an American author of horror, supernatural fiction, and suspense novels.",
        image: "author_image2.jpg",
        category: "Life"),
    Quote(
        text: "You only live once, but if you do it right, once is enough.",
        author: "Mae West",
        details:
            "Mae West was an American actress, singer, playwright, and comedian.",
        image: "author_image3.jpg",
        category: "Life"),
    Quote(
        text:
            "The purpose of life is not to be happy. It is to be useful, to be honorable, to be compassionate.",
        author: "Ralph Waldo Emerson",
        details:
            "Ralph Waldo Emerson was an American essayist and philosopher.",
        image: "author_image4.jpg",
        category: "Life"),
    Quote(
        text: "Turn your wounds into wisdom.",
        author: "Oprah Winfrey",
        details:
            "Oprah Winfrey is an American talk show host, television producer, and philanthropist.",
        image: "author_image5.jpg",
        category: "Life"),
    Quote(
        text: "Believe you can and you’re halfway there.",
        author: "Theodore Roosevelt",
        details: "A quote emphasizing self-belief and determination.",
        image: "author_image6.jpg",
        category: "Self-Belief"),
    Quote(
        text: "The way to develop self-confidence is to do the thing you fear.",
        author: "William Jennings Bryan",
        details:
            "William Jennings Bryan was an American orator and politician.",
        image: "author_image7.jpg",
        category: "Self-Belief"),
    Quote(
        text:
            "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.",
        author: "Ralph Waldo Emerson",
        details:
            "Ralph Waldo Emerson was an American essayist and philosopher.",
        image: "author_image4.jpg",
        category: "Self-Belief"),
    Quote(
        text:
            "You are never too old to set another goal or to dream a new dream.",
        author: "C.S. Lewis",
        details: "C.S. Lewis was a British writer and theologian.",
        image: "author_image8.jpg",
        category: "Self-Belief"),
    Quote(
        text: "No one can make you feel inferior without your consent.",
        author: "Eleanor Roosevelt",
        details:
            "Eleanor Roosevelt was an American political figure, diplomat, and activist.",
        image: "author_image9.jpg",
        category: "Self-Belief"),
    Quote(
        text: "Act as if what you do makes a difference. It does.",
        author: "William James",
        details: "A motivational quote encouraging positive impact.",
        image: "author_image10.jpg",
        category: "Self-Belief"),
    Quote(
        text: "Strive not to be a success, but rather to be of value.",
        author: "Albert Einstein",
        details:
            "Albert Einstein was a theoretical physicist known for his theory of relativity.",
        image: "author_image11.jpg",
        category: "Success"),
    Quote(
        text:
            "Success usually comes to those who are too busy to be looking for it.",
        author: "Henry David Thoreau",
        details:
            "Henry David Thoreau was an American essayist and philosopher.",
        image: "author_image12.jpg",
        category: "Success"),
    Quote(
        text:
            "The only place where success comes before work is in the dictionary.",
        author: "Vidal Sassoon",
        details: "Vidal Sassoon was a British hairstylist and businessman.",
        image: "author_image13.jpg",
        category: "Success"),
    Quote(
        text:
            "Courage is not the absence of fear, but rather the judgment that something else is more important than fear.",
        author: "Ambrose Redmoon",
        details:
            "Ambrose Redmoon was a writer known for his thoughts on courage.",
        image: "author_image14.jpg",
        category: "Courage"),
    Quote(
        text: "Everything you have ever wanted is on the other side of fear.",
        author: "George Addair",
        details: "A quote emphasizing overcoming fear to achieve success.",
        image: "author_image15.jpg",
        category: "Courage"),
    Quote(
        text: "It takes courage to grow up and become who you really are.",
        author: "E.E. Cummings",
        details: "E.E. Cummings was an American poet and essayist.",
        image: "author_image16.jpg",
        category: "Courage"),
    Quote(
        text:
            "Do what you feel in your heart to be right—for you’ll be criticized anyway.",
        author: "Eleanor Roosevelt",
        details:
            "Eleanor Roosevelt was an American political figure, diplomat, and activist.",
        image: "author_image9.jpg",
        category: "Courage"),
    Quote(
        text: "Fortune favors the bold.",
        author: "Virgil",
        details: "Virgil was an ancient Roman poet.",
        image: "author_image17.jpg",
        category: "Courage"),
  ];

  List<String> getCategories() {
    return _quotes.map((quote) => quote.category).toSet().toList();
  }

  Quote getRandomQuoteByCategory(String category) {
    final filteredQuotes =
        _quotes.where((quote) => quote.category == category).toList();
    final random = Random();
    return filteredQuotes[random.nextInt(filteredQuotes.length)];
  }

  Quote getRandomQuote() {
    final random = Random();
    return _quotes[random.nextInt(_quotes.length)];
  }
}
