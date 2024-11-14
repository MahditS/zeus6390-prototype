import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
   final Widget child;
  const SplashScreen({super.key, required this.child});
 

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState()
  {
    super.initState();
    Future.delayed(const Duration(seconds: 3), 
                  (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child), 
                      (route) => false);
                    }
                  );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(221, 0, 0, 0),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300,),
            Text("Zeus", style: TextStyle(color: Color.fromARGB(255, 247, 255, 96), fontSize: 35, fontWeight: FontWeight.bold),),
            Text("Battery Tracking Application", style: TextStyle(color: Color.fromARGB(255, 247, 255, 96), fontSize: 15))
          ],
        ),
    ));
  }
}