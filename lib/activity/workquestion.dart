import 'package:flutter/material.dart';
import 'package:intersect/activity/lifequestion.dart';
import 'package:localstorage/localstorage.dart';

var storage = LocalStorage('my_data.json');

class WorkQuestion extends StatefulWidget {
  const WorkQuestion({ Key? key }) : super(key: key);

  @override
  State<WorkQuestion> createState() => _WorkQuestionState();
}

class _WorkQuestionState extends State<WorkQuestion> {
  double _workSliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Question'),
      
      ),
      body: Center(
        child: Column(
          children: [
            Text('Are You happy about the work done by you today', style: Theme.of(context).textTheme.headline3,),
            Spacer(),
            Text(
              'Please slide the bar to indicate your level of work satisfaction', style: Theme.of(context).textTheme.headline5,
            ),
            Spacer(),
            Text('$_workSliderValue', style: Theme.of(context).textTheme.headline3,),
            Spacer(),
            Slider(
              value: _workSliderValue,
              min: 0.0,
              max: 100.0,
              divisions: 100,
              activeColor: Colors.blue,
              inactiveColor: Colors.red,
              thumbColor: Colors.yellow,
              mouseCursor: MaterialStateMouseCursor.clickable,
              label: _workSliderValue.toString(),
              onChanged: (double newValue) {
                setState(() {
                  _workSliderValue = newValue;
                });
              },
            ),
            Spacer(),
            RaisedButton(
              child: Text('Submit and Continue'),
              onPressed: () {
                storage.setItem('workSliderValue', _workSliderValue);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LifeQuestion()),
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