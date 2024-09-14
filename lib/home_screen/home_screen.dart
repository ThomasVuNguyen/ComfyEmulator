import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('pin 4'),
          TextButton(onPressed: (){
            changePinState();
          }, child: Text('Press Me'))
        ],
      ),
    );
  }
}

Future<void> changePinState() async{
  try {
    // Get a reference to the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the 'emulator' collection and '1' document
    DocumentReference docRef = firestore.collection('emulator').doc('1');

    // Set the data for the document
    await docRef.set({
      'state': 'on',
    });

    print('Document created successfully!');
  } catch (e) {
    print('Error creating document: $e');
  }
}
