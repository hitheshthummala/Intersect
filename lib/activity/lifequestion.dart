import 'package:flutter/material.dart';
import 'package:intersect/main.dart';
import 'package:localstorage/localstorage.dart';

var storage = LocalStorage('my_data.json');

class LifeQuestion extends StatefulWidget {
  const LifeQuestion({ Key? key }) : super(key: key);

  @override
  State<LifeQuestion> createState() => _LifeQuestionState();
}

class _LifeQuestionState extends State<LifeQuestion> {
  double _lifequestionvalue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Question'),
      
      ),
      body: Center(
        child: Column(
          children: [
            Text('Are You happy about the life you had today', style: Theme.of(context).textTheme.headline3,),
            Spacer(),
            Text(
              'Please slide the bar to indicate your level of satisfaction', style: Theme.of(context).textTheme.headline5,
            ),
            Spacer(),
            Text('$_lifequestionvalue', style: Theme.of(context).textTheme.headline3,),
            Spacer(),
            Slider(
              value: _lifequestionvalue,
              min: 0.0,
              max: 100.0,
              divisions: 100,
              activeColor: Colors.blue,
              inactiveColor: Colors.red,
              thumbColor: Colors.yellow,
              mouseCursor: MaterialStateMouseCursor.clickable,
              label: _lifequestionvalue.toString(),
              onChanged: (double newValue) {
                setState(() {
                  _lifequestionvalue = newValue;
                });
              },
            ),
            Spacer(),
            RaisedButton(
              child: Text('Submit and Continue'),
              onPressed: () {
                storage.setItem('lifequestionvalue', _lifequestionvalue);
                var health = storage.getItem('healthSliderValue');
                var work = storage.getItem('workSliderValue');
                var life = storage.getItem('lifequestionvalue');
                var obtScore = health + work + life;
                var total = 300;
                
                var existingobtained = storage.getItem('obtainedScore');
                var existingtotal = storage.getItem('totalScore');
                print('existing obtained $existingobtained existing total$existingtotal');
                if (existingobtained != null && existingtotal != null) {
                  existingobtained = existingobtained + obtScore;
                  existingtotal = existingtotal + total;
                  storage.setItem('obtainedScore', existingobtained);
                  storage.setItem('totalScore', existingtotal);
                } else {
                  storage.setItem('obtainedScore', obtScore);
                  storage.setItem('totalScore', total);
                }
                setState(() {
                  
                });
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

