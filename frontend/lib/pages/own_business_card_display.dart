import 'package:cardy_b/colors.dart';
import 'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/logic/model.dart';
import 'package:cardy_b/widget/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cardy_b/businesscard.dart';

//global variable
String dropdownValue = 'Send Card';

class MyBusinessCardDisplayPage extends StatelessWidget {
  static final Participant participant = Database().getParticipantById(
      AppState().userid);
  static final card = BusinessCard.fromParticipant(participant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      //resizeToAvoidBottomPadding: true,
      appBar: CardyBAppBar(pageTitle: 'My Business Card'),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 12,
              color: Color.fromARGB(255, card.red, card.green, card.blue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(0.05 * MediaQuery
                  .of(context)
                  .size
                  .width),
              child: Container(
                  width: 0.9 * MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 0.3 * MediaQuery
                      .of(context)
                      .size
                      .height,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(
                            0.02 * MediaQuery
                                .of(context)
                                .size
                                .height,
                          ),
                          height: 0.15 * MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: 0.15 * MediaQuery
                              .of(context)
                              .size
                              .height,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(100.0),
                            child: Image.asset(card.photo),
                          ),
                        ),
                        Expanded(
                            child:
                            Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    card.name,
                                    style: TextStyle(
                                        fontSize: 30, fontWeight: FontWeight
                                        .bold),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 0.03 * MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                    ),
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          top: 0.01 * MediaQuery
                                              .of(context)
                                              .size
                                              .width),
                                      child: Text(
                                        card.email,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 0.01 * MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                    ),
                                    child: Text(
                                      "Twitter",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                        card.twitter,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                  ),
                                  Container(
                                    child: Text(
                                      "LinkedIn",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                        card.linkedIn,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                  ),
                                  Container(
                                    child: Text(
                                      "Website",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                        card.website,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                  ),
                                ])
                        ),
                      ])
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Edit Business Card',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)),
            ),
            Container(
                padding: EdgeInsets.only(
                    top: 0.01 * MediaQuery
                        .of(context)
                        .size
                        .height),
                width: 0.55 * MediaQuery.of(context).size.width,
                height: 0.08 * MediaQuery.of(context).size.height,
                //color: Colors.black,
                child: DropDown()
            )
          ]
      ));
  }
}

class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {
  String dropdownValue = 'Send Card by QR Code';
  List <String> spinnerItems = [
    'Send Card by QR Code',
    'Send Card by NFC',
    'Send Card by Link'
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Center(
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 32,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
              underline: Container(
                color: Colors.black,
                height: 1,
              ),
              onChanged: (String data) {
                setState(() {
                  dropdownValue = data;
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ]
        ),
      )
    );
  }
}