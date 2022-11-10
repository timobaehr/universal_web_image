import 'package:flutter/material.dart';
import 'package:universal_web_image/universal_web_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Web Image Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Universal Web Image Demo Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  // 424x283
  static const validImageUrl = 'https://www.kesselheld.de/content/uploads/2018/09/durchschnittliche-heizkosten.jpg';

  // 640x300
  static const invalidImageUrl = 'https://img.utopia.de/cH68CrxH2UEqUr8eVAWC-BCgXoU=/640x300/https://utopia.de/app/uploads/2019/02/richtig-heizen-wpb-ivan-kruk-ri-190820-1280x720.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Web Image with valid XHR 200 status',
            ),
            const UniversalWebImage(
              imageUrl: validImageUrl,
            ),
            const Text(
              'Web Image with invalid XHR 0 status',
            ),
            const UniversalWebImage(
              imageUrl: invalidImageUrl,
              width: 640,
              height: 300,
            ),
            const Text(
              'Regular image with invalid XHR 0 status',
            ),
            Image.network(
              invalidImageUrl,
              width: 640,
              height: 300,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
