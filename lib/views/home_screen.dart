import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'plans_screen.dart';
import 'note_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;

  HomeScreen({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Text('Navigation')),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen(toggleTheme: toggleTheme)));
              },
            ),
            ListTile(
              title: Text('Plans'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlansScreen()));
              },
            ),
            ListTile(
              title: Text('Note'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteScreen()));
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
