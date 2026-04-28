import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({super.key});

  @override
  State<SharedPreferencesScreen> createState() => _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _displayData = "No data available";

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('age', _ageController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('timestamp', DateTime.now().toString());

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Saved!')));
  }

  Future<void> _showData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final age = prefs.getString('age');
    final email = prefs.getString('email');
    final timestamp = prefs.getString('timestamp');

    setState(() {
      if (name != null && name.isNotEmpty) {
        _displayData = "Name: $name\nAge: $age\nEmail: $email\nLast Saved: $timestamp";
      } else {
        _displayData = "No data available";
      }
    });
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _displayData = "No data available";
      _nameController.clear();
      _ageController.clear();
      _emailController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: _ageController, decoration: const InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _saveData, child: const Text('Save Name')),
                ElevatedButton(onPressed: _showData, child: const Text('Show Name')),
                ElevatedButton(onPressed: _clearData, style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent), child: const Text('Clear')),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey.shade200,
              width: double.infinity,
              child: Text(_displayData, style: const TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}