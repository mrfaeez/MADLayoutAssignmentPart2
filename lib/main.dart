import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    title: 'MAD Assessment Semester 2021/2022',
    home: Homepage(),
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Student's Name: Faeez",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            "Matric No: 1819541 \n ",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          ElevatedButton(
            child: const Text('View Assessment 1 : Using List in Flutter'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UsingList()),
              );
            },
          ),
        ],
      )),
    );
  }
}

class UsingList extends StatefulWidget {
  const UsingList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UsingListState();
  }
}

class UsingListState extends State<UsingList> {
  final inputController = TextEditingController();
  final buttonController = TextEditingController();
  int _index = 0;
  int _btnIdx = 0;

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    inputController.addListener(_handleChange);
  }

  void _handleChange() {
    setState(() {
      _index = int.parse(inputController.text);
    });
  }

  void _buttonChange() {
    setState(() {
      _btnIdx = int.parse(buttonController.text);
      if (_btnIdx >= 5)
        _btnIdx = 5;
      else if (_btnIdx <= 0) _btnIdx = 0;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cars = [
      ' ',
      'Ferrarri Enzo',
      'Lamborghini Hurricane',
      'McLaren 570s',
      'Perodua Myvi',
      'Bugatti Veyron'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assessment 1: Using List in Flutter"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: const Text('Go back!'),
          // ),
          Text(
            "a. Live Change\n",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            "Enter number (1-5) to view car models!\n",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          TextField(
            onChanged: (String value) {
              setState(() {
                _index = int.parse(value);
                if (_index >= 5)
                  _index = 5;
                else if (_index <= 0) _index = 0;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Number Here',
              hintText: 'Must be integer',
            ),
            autofocus: false,
            controller: inputController,
          ),
          Text(
            "\nCar Model: " + cars.elementAt(_index),
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            "\n\n\nb. Change With Button\n",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            "Enter number (1-5) to view car models!\n",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Number Here',
              hintText: 'Must be integer',
            ),
            autofocus: false,
            controller: buttonController,
          ),
          Padding(padding: EdgeInsets.all(4.0)),
          ElevatedButton(onPressed: _buttonChange, child: const Text('Submit')),
          Text(
            "\nCar Model: " + cars.elementAt(_btnIdx),
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ],
      )),
    );
  }
}


//ARCHIVES
// ------------------------------------------------------------------
// Future<Album> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/3'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.title);
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }

//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
