import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 33, 59),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: const Text('About', style: TextStyle(color: Colors.white)),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.grey[300],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Diatom App!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              // Add any additional welcome content here
            ],
          ),
        ),
      ),
    );
  }
}
