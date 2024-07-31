import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web/models/patient.dart';

class CameraGrid extends StatelessWidget {
  final List<Patient> patients = [
    Patient(id: '1', name: 'Patient A', room: 'Room 101', cameraID: 'AZ101'),
    Patient(id: '2', name: 'Patient B', room: 'Room 102', cameraID: 'AZ102'),
    // Add more patients as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: patients[index],
              );
            },
            child: CameraFeedCard(patient: patients[index]),
          );
        },
      ),
    );
  }
}

class CameraFeedCard extends StatelessWidget {
  final Patient patient;

  CameraFeedCard({required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(patient.room,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                'assets/sample_camera_feed.svg', // Replace with your asset path
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
