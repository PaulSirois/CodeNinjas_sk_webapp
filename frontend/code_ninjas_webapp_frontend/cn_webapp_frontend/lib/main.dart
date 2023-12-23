import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(24, 128, 179, 1),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 900,
                width: 250,
                child: Card(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ),
              Icon(
                Icons.person,
                size: 50,
              ),
              Text(
                'Admin',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
