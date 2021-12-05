import 'package:flutter/material.dart';
import './main_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentBody = "Main Menu";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Spectrum Toaster'),
        ),
        body: getCurrentBody(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_currentBody != "Main Menu") {
                        setState(() {
                          _currentBody = "Main Menu";
                        });
                      }
                    },
                    child: const Text('Main Menu'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentBody != "Recipes") {
                        setState(() {
                          _currentBody = "Recipes";
                        });
                      }
                    },
                    child: const Text('Recipes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentBody != "Settings") {
                        setState(() {
                          _currentBody = "Settings";
                        });
                      }
                    },
                    child: const Text('Settings'),
                  ),
                ],
              ),
            ],
          ),
          elevation: 0,
        ),
      ),
    );
  }

  Widget getCurrentBody() {
    if (_currentBody == "Main Menu") {
      return MainMenu();
    } else if (_currentBody == "Recipes") {
      return MainMenu(); //Return recipe widget
    } else {
      return MainMenu(); //Return settings widget
    }
  }
}
