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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: 950,
                  width: 250,
                  child: Card(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 60,
                                ),
                              ),
                              SizedBox(width: 10),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Admin',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  Icons.people,
                                  size: 60,
                                ),
                              ),
                              SizedBox(width: 10),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Ninjas',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
