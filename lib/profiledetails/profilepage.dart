import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_Signp/login.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  bool getUpdatesOnWhatsApp = false;
  String selectedGender = "female";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  User? currentUser;

  @override
  void initState() {
    super.initState();
    // Get the current user and populate the email and name
    currentUser = _auth.currentUser;
    if (currentUser != null) {
      _emailController.text = currentUser!.email!;

      // Fetch user profile from Firestore if displayName is not available
      _firestore.collection('users').doc(currentUser!.uid).get().then((doc) {
        if (doc.exists) {
          setState(() {
            _nameController.text = doc.data()?['name'] ?? currentUser!.displayName ?? '';
            selectedGender = doc.data()?['gender'] ?? 'female'; // set gender if available
            getUpdatesOnWhatsApp = doc.data()?['updatesOnWhatsApp'] ?? false;
          });
        }
      });
    }
  }

  void _updateProfile() async {
    // Update profile logic to Firestore or Firebase Auth
    await _firestore.collection('users').doc(currentUser!.uid).update({
      'name': _nameController.text,
      'email': _emailController.text,
      'gender': selectedGender,
      'updatesOnWhatsApp': getUpdatesOnWhatsApp,

    });
    // Optionally update the FirebaseAuth displayName
    await currentUser!.updateDisplayName(_nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              ); // Navigate to login screen
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Current NAme:${_auth.currentUser?.providerData ?? 'no name'}'),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue!;
                });
              },
              items: <String>['male', 'female', 'other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Get updates on WhatsApp'),
                Switch(
                  activeColor: const Color.fromARGB(255, 13, 126, 17),
                  value: getUpdatesOnWhatsApp,
                  onChanged: (bool newValue) {
                    setState(() {
                      getUpdatesOnWhatsApp = newValue;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
