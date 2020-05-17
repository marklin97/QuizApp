import 'package:flutter/material.dart';

// question class
class Question {
  final String text;
  final String type;
  final String imageId;
  Question(this.text, this.type, this.imageId);
}

// list of question object
var questions = [
  [
    Question(
        'You are a male police officer and detain a woman you suspect is attempting to smuggle illicit substances into Download Music Festival in Parramatta Park. You have told her you will conduct a strip search on her. Is this allowed?',
        'true false',
        null)
  ],
  [
    Question(
        'You are a male police officer who has detained a male suspect at Download Music Festival in Parramatta Park. The male suspect tells you he is uncomfortable with stripping in front of your police body-cam, and asks you to switch it off. What is the proper way of responding to this problem?',
        'multiple choice',
        null)
  ],
  [
    Question(
        'Police are required to make contemporaneous records of all person searches. What should be included in this record?  \n\na.	The type of search carried out \nb.	The reason for the search \nc.	The officer/s who carried out the search \nd.	Whether force was used',
        'multiple choice',
        null)
  ],
  [
    Question(
        'You find a brand new jacket in a person’s backpack with a tag still attached. They are not carrying a bag or any sort of packaging from the store they had gotten it from, nor can they provide a receipt. They claim to have paid for it using cash if questioned about transaction history.',
        'multiple choice',
        null)
  ],
];

// option classes
class OptionValue {
  final bool key;
  final String value;
  final String hint;
  OptionValue(this.value, this.key, this.hint);
}

final options = [
  [
    OptionValue("1. True", true, ''),
    OptionValue("2. False", false,
        'Consider what the Person Search manual says about searching the opposite sex'),
  ],
  [
    OptionValue(
        "1. Invite another police officer in to make it less awkward",
        false,
        'this may lead to escalation. Would be hard to diffuse the situation if you undertook this option'),
    OptionValue(
        "2. Tell the suspect you are legally obligated to film all strip searches as it is a form of evidence to prove guilt or innocence",
        true,
        'The NSW Court of Criminal Appeal '),
    OptionValue("3. Release him since he’s being troublesome", false,
        'Defensiveness is suspicious. How do we know he didn’t have drugs?'),
    OptionValue("4. Grab him and tear off his clothes", false,
        'this could lead to your suspension and possible imprisonment for brutality'),
  ],
  [
    OptionValue("1. A and B", true, ''),
    OptionValue("2. A and C", false, ''),
    OptionValue("3. B, C and D", false, ''),
    OptionValue("4. A,B,C and D", false, ''),
  ],
  [
    OptionValue(
        "1. You find a brand new jacket in a person’s backpack with a tag still attached. They are not carrying a bag or any sort of packaging from the store they had gotten it from, nor can they provide a receipt. They claim to have paid for it using cash if questioned about transaction history.",
        true,
        ' '),
    OptionValue(
        "2. You approach a person at a music festival. They don’t seem entirely lucid. You ask them a series of questions.\n Q: How did you get here? \n Q: Are you under the influence of anything? Alcohol or otherwise? \n Q: Can you show me any sort of identification?",
        false,
        ''),
    OptionValue(
        "3. You spot someone wandering about in the middle of the might holding a heavy flashlight and large bag. They say they are just heading home when asked.",
        false,
        ''),
  ],
];
// initial state for answering quiz
List<Color> color = [
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.black,
].toList();

List<Icon> icon = [
  Icon(null),
  Icon(null),
  Icon(null),
  Icon(null),
].toList();

List<Icon> checkBox = [
  Icon(Icons.check_box_outline_blank),
  Icon(Icons.check_box_outline_blank),
  Icon(Icons.check_box_outline_blank),
  Icon(Icons.check_box_outline_blank),
].toList();

List<Text> hint = [
  Text(''),
  Text(''),
  Text(''),
  Text(''),
].toList();
