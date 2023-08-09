import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AboutScreen extends HookWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Name and logo
            const SizedBox(height: 20),
            const Text(
              "Mobistory",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              "assets/mobistory_icon.jpg",
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),

            // Version
            const Text(
              "Version: 1.0.0",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Developer
            const Text(
              "Developed by",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Anonymous Killer",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Contact: mickinvest2@gmail.com",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                """
                Mobistory is an engaging mobile application designed to explore historical events in an innovative and entertaining way.
                With a focus on usability and adaptability, Mobistory provides users with a unique platform to learn about notable historical events and their contexts. 
                The app combines historical data from Wikidata, intuitive user interfaces, and interactive features to create an enriching experience for history enthusiasts and curious minds alike.
                """,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // Acknowledgments
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Special thanks to Wikimedia and Wikidata for providing the valuable historical data that powers Mobistory.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),

            // Privacy Policy and Terms of Use
            GestureDetector(
              onTap: () {
                // Navigate to Privacy Policy screen
                // You can implement the navigation logic here
              },
              child: const Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Navigate to Terms of Use screen
                // You can implement the navigation logic here
              },
              child: const Text(
                "Terms of Use",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}