import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 180, 0, 0),
            title: Image.asset('images/white_logo.png'),
            centerTitle: true),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: 0.1 * MediaQuery.of(context).size.height,
                      left: 0.3 * MediaQuery.of(context).size.width,
                      right: 0.3 * MediaQuery.of(context).size.width),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(1000.0),
                    child: Image.asset('images/photo.png'),
                  ),
                ),
                Container(
                  child: Text(
                    'Chico da Tina',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 0.03 * MediaQuery.of(context).size.width,
                    right: 0.7 * MediaQuery.of(context).size.width,
                  ),
                  child: Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 0.1 * MediaQuery.of(context).size.width,
                        right: 0.1 * MediaQuery.of(context).size.width),
                    child: TextField(
                      controller: TextEditingController()
                        ..text = 'Chicod@tina.com',
                      onChanged: (text) {
                        print("Ok: $text");
                      },
                    )),
                Container(
                  padding: EdgeInsets.only(
                    top: 0.01 * MediaQuery.of(context).size.width,
                    right: 0.6 * MediaQuery.of(context).size.width,
                  ),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 0.03 * MediaQuery.of(context).size.width,
                    right: 0.65 * MediaQuery.of(context).size.width,
                  ),
                  child: Text(
                    'Website',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 0.1 * MediaQuery.of(context).size.width,
                        right: 0.1 * MediaQuery.of(context).size.width),
                    child: TextField(
                      controller: TextEditingController()
                        ..text = 'chicotina.com',
                      onChanged: (text) {
                        print("Ok: $text");
                      },
                    )),
                Container(
                  padding: EdgeInsets.only(
                    top: 0.03 * MediaQuery.of(context).size.width,
                    right: 0.65 * MediaQuery.of(context).size.width,
                  ),
                  child: Text(
                    'LinkedIn',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 0.1 * MediaQuery.of(context).size.width,
                        right: 0.1 * MediaQuery.of(context).size.width),
                    child: TextField(
                      controller: TextEditingController()
                        ..text = 'linkedin.com/tina',
                      onChanged: (text) {
                        print("Ok: $text");
                      },
                    )),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.04 * MediaQuery.of(context).size.width,
                      right: 0.52 * MediaQuery.of(context).size.width),
                  child: RaisedButton(
                    color: Color.fromARGB(255, 180, 0, 0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    child: Text(
                      'Add Field',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ));
  }
}