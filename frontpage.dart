import 'package:flutter/material.dart';
import 'cal.dart';
import 'gradebook.dart';
import 'registration.dart';
import 'view_profile.dart';
import 'login.dart';
import 'signup.dart';
import 'myprofile.dart'; // This file defines MyProfile

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FrontPage());
  }
}

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 50,
        iconTheme: const IconThemeData(size: 50),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _drawerItem(
              Icons.calculate,
              "Calculator",
              context,
              CalculatorPage(),
            ),
            _drawerItem(Icons.book, "Gradebook", context, GradebookPage()),
            const Divider(),
            _drawerItem(
              Icons.person_add,
              "Register",
              context,
              RegistrationPage(),
            ),
            _drawerItem(
              Icons.account_circle,
              "View Profile",
              context,
              ViewProfilePage(),
            ),
            const Divider(),
            _drawerItem(Icons.login, "Login", context, LoginPage()),
            _drawerItem(
              Icons.app_registration,
              "Signup",
              context,
              SignupPage(),
            ),
            // Updated: Use MyProfile() instead of MyProfilePage()
            _drawerItem(Icons.person, "My Profile", context, MyProfile()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _headerSection(),
            _infoSection(context),
            _contactSection(),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    IconData icon,
    String title,
    BuildContext context,
    Widget page,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }

  Widget _headerSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      color: Colors.blue,
      child: Column(
        children: [
          Image.asset('assets/logo.png', height: 90),
          const SizedBox(height: 10),
          const Text(
            "Baba Guru Nanak University",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _infoSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Column(
            children: [
              if (isMobile) ...[
                Image.asset(
                  'assets/vc_sahib.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!isMobile)
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/vc_sahib.jpg',
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: const Text(
                      "Baba Guru Nanak University is dedicated to providing quality education and fostering innovation. It is a public sector university located in District Nankana Sahib, Punjab, Pakistan. The university plans to facilitate between 10,000 to 15,000 students globally. The foundation stone was laid on October 28, 2019, ahead of the 550th Guru Nanak Gurpurab by the Prime Minister of Pakistan. The Punjab government passed the Baba Guru Nanak University Nankana Sahib Act 2020, and Phase-I development has already begun.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _contactSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Colors.blue,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Contact Us",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Address: Adampur Road, Nankana Sahib, Pakistan",
            style: TextStyle(color: Colors.white),
          ),
          Text("Phone: +123 456 789", style: TextStyle(color: Colors.white)),
          Text(
            "Email: info@bgnuniversity.com",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            "© 2025 Baba Guru Nanak University. All rights reserved.",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
