import 'package:flutter/material.dart';

class AlertEmailInformation extends StatelessWidget {
  const AlertEmailInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Alert Email Information',
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 40),
      ),
    );
  }
}
