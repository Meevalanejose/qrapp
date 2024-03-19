import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            CircleAvatar(radius: 50,
              child: Icon(Icons.person,size: 50,),),
            SizedBox(height: 50,),
            QrImageView(
              data: '1234567890',
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 30),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,fixedSize: Size(100,50)),
              onPressed: () {

              },
              child:  Text('scan',style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

