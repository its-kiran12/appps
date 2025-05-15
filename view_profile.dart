import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key});

  @override
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  List<dynamic> usersList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load the list of registered users from SharedPreferences.
  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usersString = prefs.getString('users');
    if (usersString != null) {
      setState(() {
        usersList = jsonDecode(usersString);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("View Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            usersList.isEmpty
                ? const Center(child: Text("No users registered"))
                : ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    final user = usersList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            user['status'] == 'Active'
                                ? Colors.green
                                : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Display user details.
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mobile: ${user['mobile']}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Email: ${user['email']}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            user['status'] == 'Active'
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
