import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firstlime.dart';
import 'mainpage.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('userBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Login Page',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
       
      ),
      debugShowCheckedModeBanner: false,
      home: CheckFirstTimeLogin(),
    );
  }
}

class CheckFirstTimeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box<String>('userBox');
    bool isFirstTimeLogin = userBox.get('username') == null;

    return isFirstTimeLogin ? FirstTimeLoginPage() : MyApp2();
  }
}

class FirstTimeLoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            
            // SizedBox(
            //   height: 120.0,
            //   child: Icon(
            //     Icons.person,
            //     size: 100,
            //     // color: Colors.blue,
            //   ),
            // ),
            // SizedBox(height: 20.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Enter your username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  final username = _usernameController.text;
                  if (username.isNotEmpty) {
                    final userBox = Hive.box<String>('userBox');
                    userBox.put('username', username);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Let\'s Get Started',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box<String>('userBox');
    final username = userBox.get('username', defaultValue: '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $username'),
      ),
      body: Center(
        child: Text(
          'This is the second page. You have logged in before as $username',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
