import 'package:flutter/material.dart';

class NinjasTable extends StatelessWidget {
  const NinjasTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(32),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: 175,
              width: 450,
            ),
          ],
        ),
      ],
    );
  }
}
