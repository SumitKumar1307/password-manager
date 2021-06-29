import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: layout(),
    );
  }

  Widget layout() {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 10, top: 25
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 180,
                    width: 290,
                    decoration: BoxDecoration(
                      color: Color(0xFFE0DFFF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Big Block
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE0DFFF),
                          borderRadius: BorderRadius.all(Radius.circular(14))
                        ),
                        height: 75,
                        width: 75,
                      ), // lock
                      SizedBox(height: 15),
                      Container(
                          decoration: BoxDecoration(
                          color: Color(0xFFE0DFFF),
                          borderRadius: BorderRadius.all(Radius.circular(14))
                        ),
                        height: 75,
                        width: 75,
                      ),
                    ]
                  ),
                ]
              ),
              SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    for (int i=0; i<10; i++)
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        width: size.width * 0.9,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFE0DFFF),
                          borderRadius: BorderRadius.all(Radius.circular(22))
                        ),
                      )
                  ],
                ),
            
            ],
          ),
        ),
      ),
    );
  }
}