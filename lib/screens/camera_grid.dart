import 'package:flutter/material.dart';
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
            child: CameraFeedCard(
              patient: patients[index],
              imageUrl:
                  'https://www.mghf.ca/sites/default/files/styles/inline_image/public/images/2020-07/view_of_room.png?itok=6xAy8KDV', // Use a URL for each image
            ),
          );
        },
      ),
    );
  }
}

class CameraFeedCard extends StatelessWidget {
  final Patient patient;
  final String imageUrl;

  CameraFeedCard({required this.patient, required this.imageUrl});

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
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
