import 'package:flutter/material.dart';

class BoardMoneyPage extends StatefulWidget {
  @override
  _BoardMoneyPageState createState() => _BoardMoneyPageState();
}

class _BoardMoneyPageState extends State<BoardMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Board Money'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Edit Username'),
                        onTap: () {
                          // Open edit username page
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Logout'),
                        onTap: () {
                          // Logout logic
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Create Board'),
              onPressed: () {
                // Open create board page
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Join Board'),
              onPressed: () {
                // Open join board page
              },
            ),
          ],
        ),
      ),
    );
  }
}
