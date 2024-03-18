import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    Future<Map<String, dynamic>> _fetch() async {
      Map<String, dynamic> userData = {};

      if (user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .get();
        userData = snapshot.data() as Map<String, dynamic>;
      }
      return userData;
    }

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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Icon(
                Icons.person,
                size: 100,
                color: Color.fromARGB(255, 8, 61, 104),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                user?.displayName ?? 'No Display Name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 8),
                  Text(
                    "Email: ${user?.email ?? 'No Email'}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(height: 30),
            Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(width: 8),
                FutureBuilder(
                  future: _fetch(),
                  builder:
                      (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('No Phone');
                    } else {
                      String phone = snapshot.data?['Phone'] ?? 'No Phone';
                      return Text(
                        'Phone: $phone',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(height: 30),
            Flexible(
              child: Row(
                children: [
                  Icon(Icons.notes),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SingleChildScrollView(
                        child: FutureBuilder(
                          future: _fetch(),
                          builder: (context,
                              AsyncSnapshot<Map<String, dynamic>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return const Text('No Bio');
                            } else {
                              String bio = snapshot.data?['Bio'] ?? 'No bio';
                              return Text(
                                'Bio: $bio',
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        const Color.fromARGB(255, 44, 39, 39),
                                    fontWeight: FontWeight.bold),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
