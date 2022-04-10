import 'package:flutter/material.dart';
import 'package:intersect/activity/healthquestion.dart';
import 'package:localstorage/localstorage.dart';

final storage = LocalStorage('my_data.json');
   var obtscore = storage.getItem('obtainedScore');
    var totalscore = storage.getItem('totalScore');

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intersect-Innovaccer',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Intersect- Innovaccer'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
          });
        },
        child: Center(
      
          child: Column(
      
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const Text(
              //   '',
              // ),
              Spacer(),
      
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                   (obtscore!= null ?'$obtscore/$totalscore':'0/0'),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Spacer(),
              Text(
                'Hi, Employee welcome...',
                style: Theme.of(context).textTheme.headline4,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.blue,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Press the \'+\' button to add activity'),
              // IconButton(
              //   icon: Icon(Icons.menu),
              //   onPressed: () {},
              // ),
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {},
              // ),
            ],
          
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(obtscore);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HealthQuestion(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
