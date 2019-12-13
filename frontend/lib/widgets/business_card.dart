import 'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/logic/business_card.dart';
import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/logic/model.dart';
import 'package:flutter/material.dart';

class BusinessCardWidget extends StatelessWidget {
  final BusinessCard card;

  BusinessCardWidget(this.card);

  @override
  Widget build(BuildContext context) {
    Participant p = Database().getParticipantById(AppState().userid);
    var selectedAttributes = Map<String, String>();
    for(var attribute in p.cardAttributes) {
      switch(attribute) {
        case 'bio':
          selectedAttributes['bio'] = p.bio;
          break;
        case 'linkedIn':
          selectedAttributes['linkedIn'] = p.linkedIn;
          break;
        case 'twitter':
          selectedAttributes['twitter'] = p.twitter;
          break;
        case 'company':
          selectedAttributes['company'] = p.company;
          break;
        case 'position':
          selectedAttributes['position'] = p.position;
          break;
        case 'website':
          selectedAttributes['website'] = p.website;
          break;
        case 'gitHub':
          selectedAttributes['gitHub'] = p.gitHub;
          break;
        case 'cv':
          selectedAttributes['cv'] = p.cv;
          break;
      }
    }
    var attributes = DisplayPersonalInfo(selectedAttributes);
    return Card(
      elevation: 12,
      color: Color.fromARGB(255, card.red, card.green, card.blue),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(0.05 * MediaQuery.of(context).size.width),
      child: Container(
          width: 0.9 * MediaQuery.of(context).size.width,
          height: 0.3 * MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(
                    0.02 * MediaQuery.of(context).size.height,
                  ),
                  height: 0.15 * MediaQuery.of(context).size.height,
                  width: 0.15 * MediaQuery.of(context).size.height,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child: Image.asset(card.photo),
                  ),
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Text(
                        p.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.03 * MediaQuery.of(context).size.width,
                        ),
                        child: Text(
                          "Email: " + p.email,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      attributes,
                    ])),
              ])),
    );
  }
}

class DisplayPersonalInfo extends StatelessWidget {
  final Map<String, String> _fields;

  DisplayPersonalInfo(this._fields);

  @override
  Widget build(BuildContext context) {
    List<Widget> fields = List();
    _fields.forEach((title, content) {
      fields.add(
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 0.01 * MediaQuery.of(context).size.height,
                horizontal: 0.1 * MediaQuery.of(context).size.width),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                child: Text(
                  title + ": " + content,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ])
          )
      );
    });
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: fields);
  }
}