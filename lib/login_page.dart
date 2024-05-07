import 'package:face_detection/lo_db.dart';
import 'package:face_detection/utils.dart';
import 'package:flutter/material.dart';

import 'facescansreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState(){
    printIfDebug(lo_db.getUser().name);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Authenticatication"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>FaceScanScreen() ));
                },
                child: Text('Register'),

                style: ElevatedButton.styleFrom(
                  primary: Color(0xffB81736),
                  minimumSize: Size(500, 53),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>FaceScanScreen(
                    user: lo_db.getUser(),
                  ) ));
                },
                child: Text('Log in'),
                style: ElevatedButton.styleFrom(

                  primary: Color(0xffB81736),
                  minimumSize: Size(500, 53),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
