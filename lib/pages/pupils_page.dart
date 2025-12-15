import 'package:flutter/material.dart';
import 'package:w_phonics/data/demo_studentcard.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final List<String> students = [];

  void _addStudent(String name) {
    setState(() {
      students.add(name);
    });
  }

  void _removeStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  void _showAddStudentDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add student'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Student name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                _addStudent(controller.text.trim());
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pupils'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddStudentDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: students.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final name = students[index];

            return GestureDetector(
              onLongPress: () => _removeStudent(index),
              
              child: StudentCard(name: name),
            );
          },
        ),
      ),
    );
  }
}
