import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Commit 1: Base Application Structure
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Image Count Fun'),
    );
  }
}

// Commit 2: Define MyHomePage as a StatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage ({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Commit 3: Define _MyHomePageState with counter and image toggle logic
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0; // Counter variable initialized
  bool isImageOne = true; // Booleaan for image toggle

  // Commit 4: Define Image URLs
  String imageOne = "https://raw.githubusercontent.com/Shawnm-MAD/CW1/main/sunflower.jpg";
  String imageTwo = "https://raw.githubusercontent.com/Shawnm-MAD/CW1/main/panda.jpg" ;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState(){
    super.initState();

    // Commit 5: Initialize AnimationController and FadeTransition Animation
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  // Commit 6: Increment Counter function
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Commit 7: Toggle Image function with animation
  void _toggleImage() {
    setState(() {
      isImageOne = !isImageOne;
    });
    _animationController.forward(from: 0.0);
  }

  // Commit 8: Disposing animation controller
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

// Commit 9: Define AppBar with dynamic color theme
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),

// Commit 10: Add padding
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Commit 11: Display counter text
            const Text(
              'You have pushed the button this many times:',
              style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            
          // Commit 12: Display counter number
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),

          // Commit 13: Increment button
          ElevatedButton(
            onPressed: _incrementCounter,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Increment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 40), 

            // Commit 14: Image with animation
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Image.network(
                    isImageOne ? imageOne : imageTwo,
                    fit: BoxFit.cover,
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 20),

             // Commit 15: Toggle Image Button
             ElevatedButton(
              onPressed: _toggleImage,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.greenAccent[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Toggle Image",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    )
  }
    )
  }
}