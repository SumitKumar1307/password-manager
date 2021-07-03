import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'add.dart';

class EditPage extends StatelessWidget {
  EditPage(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: EditScreen(index: this.index,),
      backgroundColor: Color(0xFFE0DFFF),
    );
  }
}

class EditScreen extends StatefulWidget {
  final int index;
  const EditScreen({Key? key, required this.index}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              top(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget top() {
    return Container(
      child: SingleChildScrollView(
        child: Row(children: <Widget>[
          Container(
            height: 180,
            width: 260,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit\nPassword",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: CupertinoColors.systemGrey),
                    ),
                  ),
                  height: 60,
                ),
                Icon(Icons.security_rounded)
              ],
            ),
          ),
          SizedBox(width: 10), // Big Block
          Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              height: 75,
              width: 75,
              child: CupertinoButton(
                child: Icon(Icons.lock),
                onPressed: () =>
                    {Navigator.popUntil(context, ModalRoute.withName('/'))},
              ),
            ), // lock
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              height: 75,
              width: 75,
              child: CupertinoButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AddPage(),
                      ))
                },
                child: Icon(Icons.add),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
