import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter app'),
        backgroundColor: Color.fromARGB(255, 32, 37, 40),
      ),
      body: const Center(
        child: Text('Hello world!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Zapp!');
          Future<void>.value()
              .then((val) => throw new Exception('You got Zapped!'));
        },
        backgroundColor: Colors.yellow[700],
        child: const Icon(Icons.electric_bolt),
      ),
    );
  }
}
