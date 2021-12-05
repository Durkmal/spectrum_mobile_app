import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final List<String> _functions = [
    'None',
    'Preheat',
    'Reheat',
    'Warm',
    'Air Fry',
    'Broil',
    'Toast',
    'Roast',
    'Bagel',
    'Pizza'
  ];

  int _index = 0;
  int _temp = 150;
  int _timer = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
          child: RichText(
            text: const TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(text: 'Functions'),
                ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_index > 0) {
                    setState(() {
                      _index--;
                    });
                    return;
                  }

                  if (_index == 0) {
                    setState(() {
                      _index = _functions.length - 1;
                    });
                  }
                },
                child: const Text('<-'),
              ),
              Text(_functions[_index]),
              ElevatedButton(
                onPressed: () {
                  if (_index < _functions.length - 1) {
                    setState(() {
                      _index++;
                    });
                    return;
                  }

                  if (_index >= _functions.length - 1) {
                    setState(() {
                      _index = 0;
                    });
                  }
                },
                child: const Text('->'),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_temp > 150) {
                    setState(() {
                      _temp -= 5;
                    });
                  }
                },
                child: const Text('<-'),
              ),
              Text(_temp.toString()),
              ElevatedButton(
                onPressed: () {
                  if (_temp < 450) {
                    setState(() {
                      _temp += 5;
                    });
                  }
                },
                child: const Text('->'),
              )
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_timer > 0) {
                      setState(() {
                        _timer -= 30;
                      });
                    }
                  },
                  child: const Text('<-'),
                ),
                Text(timerToTimeLeft()),
                ElevatedButton(
                  onPressed: () {
                    if (_timer < 3600) {
                      setState(() {
                        _timer += 30;
                      });
                    }
                  },
                  child: const Text('->'),
                )
              ],
            )),
      ],
    );
  }

  String timerToTimeLeft() {
    int h, m, s;

    m = _timer ~/ 60;
    s = _timer - (m * 60);

    String minutesLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    return "$minutesLeft:$secondsLeft";
  }
}
