import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:password_manager/add.dart';
import 'data/data.dart';

void main(List<String> args) => runApp(PasswordManger());

class PasswordManger extends StatelessWidget {
  const PasswordManger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: layout(), backgroundColor: Color(0xFFE0DFFF));
  }

  Widget layout() {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
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
                      left: 40,
                      right: 40,
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your\nVault",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                                  BorderSide(color: CupertinoColors.systemGrey),
                            ),
                          ),
                          height: 60,
                        ),
                        Icon(Icons.security_rounded)
                      ],
                    ),
                  ),
                  SizedBox(width: 10), // Big Block
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        height: 75,
                        width: 75,
                        child: Icon(Icons.lock),
                      ), // lock
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        height: 75,
                        width: 75,
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => AddPage(),
                              ),
                            );
                          },
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: <Widget>[
                  for (var password in passwords)
                    GestureDetector(
                      onLongPress: () => showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                          title: Text("What do you want to do?"),
                          message: Text("Choose One"),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () => {Navigator.pop(context)},
                              child: Text("Edit"),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () => {Navigator.pop(context)},
                              child: Text("Copy"),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () => {
                                print("Hello"),
                                showCupertinoDialog(
                                  context: context,
                                  builder: (context) => CupertinoAlertDialog(
                                    title: Text("Delete Password For " +
                                        password.service +
                                        "?"),
                                    content: Text(
                                        "You have opted to delete the password for " +
                                            password.service +
                                            " that you have stored on our services."
                                                " Are you sure that you want to Delete it?"),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: Text("Yes"),
                                        isDefaultAction: false,
                                        onPressed: () => {Navigator.popUntil(context,ModalRoute.withName('/'))},
                                      ),
                                      CupertinoDialogAction(
                                        child: Text("No"),
                                        isDefaultAction: true,
                                        onPressed: () => {Navigator.popUntil(context,ModalRoute.withName('/'))},
                                      )
                                    ],
                                  ),
                                ),
                              },
                              child: Text("Delete"),
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: Text("Cancel"),
                            onPressed: () => {
                              Navigator.pop(context),
                            },
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 20,
                          bottom: 20,
                        ),
                        margin: EdgeInsets.only(bottom: 20),
                        width: size.width * 0.9,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  password.service,
                                  style: TextStyle(
                                    color: CupertinoColors.activeBlue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                  ),
                                ),
                                Icon(Icons.edit),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  password.passwordHidden,
                                  style: TextStyle(
                                    color: CupertinoColors.activeBlue,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(Icons.copy),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
