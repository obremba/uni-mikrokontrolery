import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    await FirebaseMessaging.instance.subscribeToTopic("everyone");
  } catch (_) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Czujnik ruchu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _notificationsActive = false;
  bool _loading = false;

  final checkStateUrl = Uri.https('uni.morga.dev', 'status');
  final changeStateUrl = Uri.https('uni.morga.dev', 'status/change');

  void _changeActiveState() {
    if (!_loading) {
      setState(() {
        _loading = true;
      });

      http.post(
        changeStateUrl,
        body: jsonEncode({'active': !_notificationsActive}),
        headers: {'Content-Type': 'application/json'},
      ).then((response) {
        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          setState(() {
            _notificationsActive = jsonResponse['active'];
            _loading = false;
          });
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _loading = true;
    });

    http.get(checkStateUrl).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          _notificationsActive = jsonResponse['active'];
          _loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _notificationsActive ? 'Aktywny' : 'Nieaktywny',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeActiveState,
        tooltip: 'Zmień stan czujnika',
        backgroundColor: _loading ? Colors.grey : (_notificationsActive ? Colors.green : Colors.red),
        child: Icon(_notificationsActive ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
