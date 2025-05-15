import 'package:flutter/material.dart';

void main() {
  runApp(const GradebookApp());
}

class GradebookApp extends StatelessWidget {
  const GradebookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GradebookPage(),
    );
  }
}

class GradebookPage extends StatelessWidget {
  // ✅ List ko const banaya
  static const List<Map<String, dynamic>> subjects = [
    {'subject': 'Math', 'grade': 'A', 'marks': 95},
    {'subject': 'Science', 'grade': 'B', 'marks': 85},
    {'subject': 'English', 'grade': 'A', 'marks': 90},
    {'subject': 'History', 'grade': 'C', 'marks': 70},
    {'subject': 'Physics', 'grade': 'B', 'marks': 80},
  ];

  const GradebookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gradebook'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 20,
            columns: const [
              DataColumn(label: Text('Subject')),
              DataColumn(label: Text('Grade')),
              DataColumn(label: Text('Marks')),
            ],
            rows:
                subjects.map((subject) {
                  return DataRow(
                    cells: [
                      DataCell(Text(subject['subject'])),
                      DataCell(Text(subject['grade'])),
                      DataCell(Text(subject['marks'].toString())),
                    ],
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
