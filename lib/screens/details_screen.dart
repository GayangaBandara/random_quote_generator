import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../widgets/constants.dart';

class DetailsScreen extends StatelessWidget {
  final Quote quote;

  const DetailsScreen({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientPrimary,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: const Text(
              "Quote Details",
              style: TextStyle(
                fontFamily: 'Lora',
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 4,
            shadowColor: Colors.black26,
            centerTitle: true,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              width: screenWidth,
              height: screenHeight,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: AppColors.gradientSecondary,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const Icon(Icons.format_quote, size: 40, color: AppColors.primary),
                                const SizedBox(height: 10),
                                Text(
                                  '"${quote.text}"',
                                  style: const TextStyle(
                                    fontFamily: 'Lora',
                                    fontSize: 22,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/${quote.image}',
                              height: screenHeight * 0.15,
                              width: screenHeight * 0.15,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '- ${quote.author}',
                            style: const TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          quote.details,
                          style: const TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 18,
                            color: AppColors.textSecondary,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
