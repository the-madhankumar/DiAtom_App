import 'package:diatom/components/buttons.dart';
import 'package:diatom/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:diatom/components/square_tile.dart';
import 'package:diatom/components/textfield.dart';
import 'package:diatom/pages/nav.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();
  String errorMessage = '';

  Future<void> registerUser() async {
    setState(() {
      errorMessage = ''; // Reset error message
    });

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: SpinKitSpinningLines(
            color: Colors.red, // You can customize the color if needed
            size: 100.0, // You can customize the size if needed
            lineWidth: 2.0, // You can customize the line width if needed
            itemCount: 7, // You can customize the number of lines if needed
            duration: Duration(
                milliseconds:
                    10000), // You can customize the duration if needed
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Additional user details
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(usernameController.text);
      }

      Navigator.pop(context); // Close the loading screen

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const nav()),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the loading screen
      setState(() {
        errorMessage = e.message ?? 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 1),
                const Icon(
                  Icons.person_add,
                  size: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Join us today!",
                  style: TextStyle(
                    color: Color.fromRGBO(97, 97, 97, 1),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                textfield(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                textfield(
                  controller: usernameController,
                  hintText: "Username",
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                textfield(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                textfield(
                  controller: phoneController,
                  hintText: "Phone Number",
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                textfield(
                  controller: bioController,
                  hintText: "Bio",
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                buttons(onTap: registerUser),
                const SizedBox(height: 15),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Or Continue With',
                            style: TextStyle(
                                color: Color.fromRGBO(97, 97, 97, 1))),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/images/google.png'),
                    SizedBox(width: 10),
                    SquareTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('already a member?'),
                          SizedBox(width: 4),
                          Text(
                            'login now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}