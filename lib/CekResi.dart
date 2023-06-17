import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(TrackingApp());

class TrackingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TrackingScreen(),
    );
  }
}

class TrackingScreen extends StatefulWidget {
  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  TextEditingController _trackingNumberController = TextEditingController();
  String _result = '';

  Future<void> _trackPackage() async {
    String trackingNumber = _trackingNumberController.text;
    final apiUrl = 'https://api.tracking.my.id/track/jnt/{tracking_number}';

    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          _result = data['status'];
        });
      } else {
        setState(() {
          _result = 'Error occurred';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _trackingNumberController,
              decoration: InputDecoration(
                labelText: 'Masukkan Nomor Resi',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _trackPackage,
              child: Text('Track Package'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
