import 'package:flutter/material.dart';
//import 'dashboard.dart';

void main() {
  runApp(const LogInPage());
}

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(24, 128, 179, 1),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 240, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your username',
                            labelText: 'Username',
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              //move to dashboard screen
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Background color
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
