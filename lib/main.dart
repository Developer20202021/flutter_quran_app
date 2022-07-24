import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  runApp(const MyApp());
}

List g = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner:false,
      home: const MyHomePage(title: ''),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List widgetFunc = [];

  void getWidget() {
    for (var i = 0; i < 114; i++) {
      widgetFunc.add(getSurahAyah(
        index: i + 1,
      ));
    }
  }

  @override
  void initState() {
    setState(() {
      getWidget();
      getNumber();
      print(numberN);
    });

    super.initState();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List numberN = [];
  getNumber() {
    for (var i = 0; i < 114; i++) {
      numberN.add(i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: numberN.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: GestureDetector(
                    onTap: () {
                      print('clicked');
                      print(index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => getSurahAyah(
                                  index: index + 1,
                                )),
                      );
                    },
                    child: Text(
                      quran.getSurahName(numberN[index]),
                    ),
                  ),
                );
              }))),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class getQuran extends StatefulWidget {
  const getQuran({Key? key}) : super(key: key);

  @override
  State<getQuran> createState() => _getQuranState();
}

class _getQuranState extends State<getQuran> {
  List numberN = [];
  getNumber() {
    for (var i = 0; i < 114; i++) {
      numberN.add(i + 1);
    }
  }

  @override
  void initState() {
    setState(() {
      getNumber();
      print(numberN);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: numberN.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: GestureDetector(
              onTap: () {
                print('clicked');
                print(index);
                //        Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => getSurahAyah(index: index+1,)),
                // );
              },
              child: Text(
                quran.getSurahName(numberN[index]),
              ),
            ),
          );
        }));
  }
}

class getSurahAyah extends StatefulWidget {
  final int index;

  const getSurahAyah({Key? key, this.index = 0}) : super(key: key);

  @override
  State<getSurahAyah> createState() => _getSurahAyahState();
}

class _getSurahAyahState extends State<getSurahAyah> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView.builder(
            itemCount: quran.getVerseCount(widget.index),
            itemBuilder: ((context, i) {
              
              return ListTile(
                
                title: 
                  
                      
                    //   Text(quran.getBasmala(), 
                    //   textAlign: TextAlign.right,
                    //  style: TextStyle(fontSize: 25),)
                      
                      Text(
                       
                    quran.getVerse(widget.index, i+1 , verseEndSymbol: true),
                     textAlign: TextAlign.right,
                     style: TextStyle(fontSize: 30),
                    ),
                    
                   
                
                    
              );
            })));
  }
}
