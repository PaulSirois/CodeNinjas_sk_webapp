import 'package:flutter/material.dart';

class NinjasTable extends StatelessWidget {
  const NinjasTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment(-.92, 0),
              child: Text(
                'Most Recent',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(450),
                1: FixedColumnWidth(450),
                2: FixedColumnWidth(450),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                _buildTableRow(context),
                _buildTableRow(context),
                _buildTableRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(BuildContext context) {
    return TableRow(
      children: <Widget>[
        _buildRoundedButton(context),
        _buildRoundedButton(context),
        _buildRoundedButton(context),
      ],
    );
  }

  Widget _buildRoundedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          // what happens when the button is pressed
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const SizedBox(
          height: 235,
          child: Center(
              // Add text or icons inside the button here
              ),
        ),
      ),
    );
  }
}
