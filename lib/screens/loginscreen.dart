import 'package:flutter/material.dart';
import 'package:my_pocket_wallet/screens/maindashboard.dart';
import 'package:my_pocket_wallet/screens/signgin.dart';
import 'package:url_launcher/url_launcher.dart';

// LoginPage widget for the login screen.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // Function to handle phone call
  void _callSupport() async {
    const phoneNumber = 'tel:0779711363'; // Replace with your support phone number
    if (await canLaunchUrl(Uri.parse(phoneNumber))) {
      await launchUrl(Uri.parse(phoneNumber));
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: const Center(
          child: Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardPage()),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text('Don’t have an account? Sign Up'),
            ),

            const SizedBox(height: 10),
            //added call button
            ElevatedButton.icon(
              onPressed: _callSupport,
                icon: const Icon(Icons.phone),
                label: const Text('Call Support'),
                style: ElevatedButton.styleFrom(
                //backgroundColor: Color.fromARGB(255, 144, 184, 223),
                backgroundColor:Colors.blue.shade200),
              //call button  
            ),
            
          ],
        ),
      ),
    );
  }
}
