import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

var box;

void main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('settings');
  box.put('heart',0);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override


  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Demo Settings',
      home: Scaffold(

        body:
        // body: ValueListenableBuilder<Box>(
        //   valueListenable: Hive.box('settings').listenable(),
        //   builder: (context, box, widget) {
        //     return Center(
        Center(
              child:

              Center(
                child: Column(
                  children: [
                    // Switch(
                    //   value: box.get('darkMode', defaultValue: false),
                    //   onChanged: (val) {
                    //     box.put('darkMode', val);
                    //   },
                    // ),
                    SizedBox(height: 200,),
                    ElevatedButton(
                        onPressed: (){
                          box.put('heart', 10);
                          print('put 클릭');
                        },
                        child: Text('put')),

                    ElevatedButton(
                        onPressed: (){
                          int Hget=box.get('heart');
                          // int Hget2;
                          print(Hget.toString());
                          // Hget2=int.parse(Hget);
                           Hget--;
                          box.put('heart', Hget);

                        },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                              (states) {
                            return states.contains(MaterialState.pressed)
                                ? Colors.black
                                : null;
                          },
                        ),
                      ),
                      child: const Text(
                        'Elevated Button',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                  ],
                ),
              ),
            ),

      ),
    );
  }
}