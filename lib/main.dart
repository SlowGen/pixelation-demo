import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(
        title: 'Photo Pixelation, click FAB to toggle size',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLarge = false;

  void _toggleSize() {
    setState(() {
      _isLarge = !_isLarge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('This image seems unaffected'),
              Image.asset('images/background.jpg', width: _isLarge ? 800 : 300),
              Text('These two images look much better larger, and awful small'),
              Image.asset('images/bernie.jpg', width: _isLarge ? 800 : 200),
              Image.asset('images/north.jpg', width: _isLarge ? 800 : 300),
              Text('This seems bad at both sizes'),
              Image.asset('images/gridmat.jpg', width: _isLarge ? 800 : 300),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleSize,
        tooltip: 'Toggle Size',
        child: const Icon(Icons.photo_size_select_actual),
      ),
    );
  }
}
