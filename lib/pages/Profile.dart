import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Move the user initialization inside the build method
    final User? user = FirebaseAuth.instance.currentUser;

    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 33, 59),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: const Text('Profile', style: TextStyle(color: Colors.white)),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 100,
                color: Color.fromARGB(255, 8, 61, 104),
              ),
              const SizedBox(height: 16),
              Text(
                user?.displayName ?? 'No Display Name',
                style: TextStyle(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold, // Add FontWeight.bold here
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'AI DEVELOPER | APP DEVELOPER',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              if (user !=
                  null) // Check if user is not null before accessing properties
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email),
                    const SizedBox(width: 8),
                    Text(
                      "Email: ${user.email}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 8),
                  Text(
                    '+91-9655364633',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
