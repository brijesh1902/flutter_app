import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'ui/mapscreen.dart';
import 'ui/newslist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () =>
        Navigator.pushReplacement(context, PageTransition(
        child: const MyHomePage(),
        type: PageTransitionType.rightToLeftWithFade)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/flutter_logo.png',
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height/2),
      ),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: setBody(),
    );
  }

  Widget setBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.blue, // Splash color
              onTap: () {
                Navigator.push(context, PageTransition(
                    child: const NewsScreen(),
                    type: PageTransitionType.rightToLeft)
                );
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: const Center(child: Text('News List',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
          ),

          const SizedBox(height: 50),

          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white70, // Splash color
              onTap: () {
                Navigator.push(context, PageTransition(
                    child: const MapScreen(),
                    type: PageTransitionType.rightToLeft)
                );
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text('Google Maps',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
          ),

        ],
      ),
    );
  }
}


