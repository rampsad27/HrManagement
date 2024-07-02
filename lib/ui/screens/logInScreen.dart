import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  fillColor: Colors.amber,
                  border: OutlineInputBorder(),
                  hintText: 'Email'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  fillColor: Colors.amber,
                  border: OutlineInputBorder(),
                  hintText: 'Password'),
            ),
            ElevatedButton(
                onPressed: () {
                  context.go('/userlist');
                },
                child: const Text("LogIn"))
          ],
        ),
      ),
    );
  }
}
