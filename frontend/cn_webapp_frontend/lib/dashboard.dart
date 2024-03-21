import 'package:flutter/material.dart';
import './ninjas.dart';
import './main.dart';

class PageDashboard extends StatelessWidget {
  final String username;

  const PageDashboard({required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 128, 179, 1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                height: 950,
                width: 220,
                child: Card(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIconButton(
                          icon: Icons.account_circle,
                          label: username,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          onPressed: () {
                            // What happens when the admin's button is pressed
                          },
                        ),
                        _buildIconButton(
                          icon: Icons.people,
                          label: 'Ninjas',
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          onPressed: () {
                            // what happens when the ninjas button is pressed
                          },
                        ),
                        const Spacer(),
                        _buildLogoutButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: NinjasTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required double fontSize,
    required FontWeight fontWeight,
    required VoidCallback onPressed,
    Color color = Colors.black,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.topCenter,
          child: Icon(
            icon,
            size: 60,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                ),
                child: SizedBox(
                  height: 60, // Limiting height to ensure text fits
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LogInPage()),
          );
        },
        child: const Text(
          'Logout',
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
