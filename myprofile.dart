import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

// Import your FrontPage and LogoutPage if they are in separate files.
import 'frontpage.dart';
import 'logout.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? email = "";
  String? gender = "";
  String? address = "";
  String? imagePath;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data from SharedPreferences.
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
      gender = prefs.getString('gender') ?? '';
      address = prefs.getString('address') ?? '';
      imagePath = prefs.getString('imagePath');
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          // Home Button: Navigates to FrontPage.
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Replace with your navigation logic.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FrontPage()),
              );
            },
          ),
          // Logout Button: Navigates to LogoutPage.
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()),
              );
            },
          ),
        ],
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Profile image display.
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                imagePath != null
                                    ? FileImage(File(imagePath!))
                                    : null,
                            child:
                                imagePath == null
                                    ? Icon(Icons.person, size: 50)
                                    : null,
                          ),
                          SizedBox(height: 20),
                          // Email display.
                          Text(
                            email ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Gender display.
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wc, size: 20),
                              SizedBox(width: 5),
                              Text(
                                gender ?? '',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Address display.
                          Text(
                            address ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
    );
  }
}
