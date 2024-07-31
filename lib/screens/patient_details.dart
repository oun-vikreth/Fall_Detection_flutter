import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web/main.dart';
import 'package:flutter_web/models/patient.dart';

class PatientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Patient patient =
        ModalRoute.of(context)!.settings.arguments as Patient;

    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Camera ID: ${patient.cameraID}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Target Audience: ${patient.name}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Location: ${patient.room}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/sample_camera_feed.svg', // Update with actual path
                        width: 300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
