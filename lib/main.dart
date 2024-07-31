import 'package:flutter/material.dart';
import 'package:flutter_web/models/patient.dart';
import 'package:flutter_web/screens/camera_grid.dart';
import 'package:flutter_web/screens/patient_registration.dart';
import 'package:flutter_web/screens/patient_details.dart';

void main() {
  runApp(HospitalMonitoringApp());
}

class HospitalMonitoringApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Monitoring',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/register': (context) => PatientRegistration(),
        '/details': (context) => PatientDetails(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Monitoring'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
          )
        ],
      ),
      body: Row(
        children: [
          Sidebar(),
          Expanded(child: CameraGrid()),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Color(0xFF9B6A47),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'AI Camera Management Screen',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Divider(color: Colors.white),
          SidebarItem(title: 'Camera full screen display'),
          SidebarItem(title: 'Alert email confirmation registration'),
          SidebarItem(title: 'Alert email information'),
          SidebarItem(title: 'Initial setting'),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;

  SidebarItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
