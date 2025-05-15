import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'frontpage.dart'; // Importing the existing FrontPage file

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  String selectedStatus = 'Active'; // Default status

  void registerUser() async {
    if (emailController.text.isEmpty || mobileController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email and Mobile Number are required"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Load existing users data from SharedPreferences.
      String? usersString = prefs.getString('users');
      List<dynamic> usersList = [];
      if (usersString != null) {
        usersList = jsonDecode(usersString);
      }

      // Create a new user object.
      Map<String, dynamic> newUser = {
        'email': emailController.text,
        'mobile': mobileController.text,
        'status': selectedStatus,
      };

      // Append the new user to the list.
      usersList.add(newUser);

      // Save the updated users list back to SharedPreferences.
      await prefs.setString('users', jsonEncode(usersList));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User Registered Successfully"),
          backgroundColor: Colors.green,
        ),
      );

      print("Registered user: $newUser");

      // Redirect to existing front page after registration.
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FrontPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: mobileController,
              decoration: const InputDecoration(labelText: "Mobile Number"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            const Text("Status"),
            Row(
              children: [
                Radio(
                  value: 'Active',
                  groupValue: selectedStatus,
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value as String;
                    });
                  },
                ),
                const Text("Active"),
                Radio(
                  value: 'Inactive',
                  groupValue: selectedStatus,
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value as String;
                    });
                  },
                ),
                const Text("Inactive"),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerUser,
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
