import 'package:flutter/material.dart';
import 'package:flutter_web/models/patient.dart';

class PatientRegistration extends StatefulWidget {
  @override
  _PatientRegistrationState createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _roomController = TextEditingController();
  final _cameraIDController = TextEditingController();

  void _registerPatient() {
    if (_formKey.currentState!.validate()) {
      final newPatient = Patient(
        id: DateTime.now().toString(),
        name: _nameController.text,
        room: _roomController.text,
        cameraID: _cameraIDController.text,
      );

      // Perform registration logic here
      // For now, just print the new patient details
      print(
          'Registered new patient: ${newPatient.name}, ${newPatient.room}, ${newPatient.cameraID}');

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register New Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the patient name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _roomController,
                decoration: InputDecoration(labelText: 'Room Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the room number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cameraIDController,
                decoration: InputDecoration(labelText: 'Camera ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the camera ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerPatient,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
