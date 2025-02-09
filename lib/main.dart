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
  int_counter = 0; // Counter variable initialized
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
    )
  }
}