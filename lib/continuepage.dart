import 'package:dream_destiny/gopage.dart';
import 'package:dream_destiny/weddingdate.dart';
import 'package:flutter/material.dart';

class Continuepage extends StatefulWidget {
  const Continuepage({super.key});

  @override
  State<Continuepage> createState() => _ContinuepageState();
}

class _ContinuepageState extends State<Continuepage> {
  String selectedRole = ''; // Variable to store selected role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Tell us who you are',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 50),

              // Groom selection
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = 'Groom';
                  });
                },
                child: Column(
                  children: [
                    const Text(
                      'Groom',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/45c2c369-38f5-4e64-9ade-0e7c672ce703.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: selectedRole == 'Groom'
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Bride selection
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = 'Bride';
                  });
                },
                child: Column(
                  children: [
                    const Text(
                      'Bride',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/e58d0ad6-37fe-42d4-821e-7f926a14ee3f.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: selectedRole == 'Bride'
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Continue button
              Container(
                height: 50,
                width: 160,
                child: TextButton(
                  onPressed: selectedRole.isNotEmpty
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Gopage(),
                            ),
                          );
                        }
                      : null, // Disable button if no role is selected
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        selectedRole.isNotEmpty ? Colors.pink : Colors.grey),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
