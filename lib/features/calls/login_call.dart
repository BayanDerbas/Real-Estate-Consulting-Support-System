import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/calls/call_page.dart';
import 'package:graduation_project/features/calls/calls_service.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final SecureStorage storage = SecureStorage();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _id = TextEditingController();

  void _handleLogin() async {
    final trimmedId = _id.text.trim();
    final trimmedName = _name.text.trim();

    if (trimmedId.isEmpty || trimmedName.isEmpty) {
      Get.snackbar('Error', 'Please enter both name and ID');
      return;
    }

    await storage.saveIdCall(trimmedId);
    await storage.saveNameCall(trimmedName);

    CallServices services = CallServices();
    services.onUserLogin(trimmedId, trimmedName);

    Get.to(() => const CallPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _name,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _id,
              decoration: InputDecoration(
                labelText: 'ID',
                prefixIcon: Icon(Icons.perm_identity),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
