import 'package:flutter/material.dart';
import 'login.dart'; // Ensure karo ke sahi import ho

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner remove karne ke liye
      home: LoginPage(), // Ye ensure karo ke FrontPage() call ho rahi hai
    ),
  );
}
