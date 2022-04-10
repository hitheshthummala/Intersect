import 'package:flutter/material.dart';
import 'package:intersect/activity/workQuestion.dart';
import 'package:localstorage/localstorage.dart';

var storage = LocalStorage('my_data.json');
class HealthQuestion extends StatefulWidget {

  const HealthQuestion({ Key? key }) : super(key: key);

  @override
  State<HealthQuestion> createState() => _HealthQuestionState();
}

class _HealthQuestionState extends State<HealthQuestion> {

  double _healthSliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Question'),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
            // Text(
            //   'Hi, Employee welcome...',
            //   style: Theme.of(context).textTheme.headline3,
            // ),
            Spacer(),
            Text('How Are you Feeling Today?', style: Theme.of(context).textTheme.headline5),
            Spacer(),
            Text(
              'Please slide the bar to indicate your level of health', style: Theme.of(context).textTheme.headline5,
            ),
            Spacer(),
            Text('$_healthSliderValue', style: Theme.of(context).textTheme.headline3,),
            Spacer(),
            Slider(
              value: _healthSliderValue,
              min: 0.0,
              max: 100.0,
              divisions: 100,
              activeColor: Colors.red,
              inactiveColor: Colors.blue,
              thumbColor: Colors.yellow,
              mouseCursor: MaterialStateMouseCursor.clickable,
              label: _healthSliderValue.toString(),
              onChanged: (double newValue) {
                setState(() {
                  _healthSliderValue = newValue;
                });
              },
            ),
            Spacer(),
            RaisedButton(
              child: Text('Submit and Continue'),
              onPressed: () {
                storage.setItem('healthSliderValue', _healthSliderValue);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkQuestion()),
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