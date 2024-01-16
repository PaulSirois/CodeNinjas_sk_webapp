import 'package:flutter/material.dart';

class NinjasTable extends StatelessWidget {
  const NinjasTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
            ],
          ),
          TableRow(
            children: <Widget>[
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
            ],
          ),
          TableRow(
            children: <Widget>[
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 175,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
