import 'package:app/auth/view/pages/QuickDefinition.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {


  @override
  void initState(){
    super.initState();
    startTime();
  }
  void startTime(){
    Timer(Duration(seconds: 3), navigateToAnotherScreen);
  }

  void navigateToAnotherScreen(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => quickDefinitionApp()));
  

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.network('https://img.icons8.com/?size=100&id=39132&format=png&color=00a9d4'),
           const SizedBox(height: 5,),
            const Text(
              'Bem vindo ao \n Termo Fácil',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          
          ],
        ),
      ),
    );
  }
}

