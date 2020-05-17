import 'package:flutter/material.dart';
import 'package:QuizApp/screens/widgets/setting.dart';
import 'package:QuizApp/screens/widgets/faqs.dart';
import 'package:QuizApp/screens/widgets/manual.dart';
import 'package:QuizApp/screens/widgets/resource.dart';
import 'package:QuizApp/screens/widgets/contact.dart';

class DrawerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Container(
            height: height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/starrySky.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.all(50.0),
            child: RawMaterialButton(
              onPressed: () {},

              // constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/police_icon2.png'),
                child: Align(
                  alignment: Alignment(0, 1.5),
                  child: Text('Mark Lin'),
                ),
              ),
              shape: CircleBorder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
          ),
          ListTile(
            leading: Icon(
              Icons.star_half,
              size: 25,
              //color: Colors.blue,
            ),
            title: Text(
              "LEADER BOARD",
              style: TextStyle(
                fontSize: 18,
                // color: Colors.blue,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          new Divider(
            height: 0.5,
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 25,
              //color: Colors.blue,
            ),
            title: Text(
              "SETTINGS",
              style: TextStyle(
                fontSize: 18,
                // color: Colors.blue,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => Setting(),
              ),
            ),
          ),
          new Divider(
            height: 0.5,
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              size: 25,
              // color: Colors.blue,
            ),
            title: Text(
              "USER MANUAL",
              style: TextStyle(
                fontSize: 18,
                // color: Colors.blue,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => Manual(),
              ),
            ),
          ),
          new Divider(
            height: 1,
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.import_contacts,
              size: 25,
              // color: Colors.blue,
            ),
            title: Text(
              "RESOURCES",
              style: TextStyle(
                fontSize: 18,
                // color: Colors.blue,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => Resources(),
              ),
            ),
          ),
          new Divider(
            height: 1,
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              size: 25,
              // color: Colors.blue,
            ),
            title: Text(
              "FAQS",
              style: TextStyle(
                fontSize: 18,
                // color: Colors.blue,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => FAQS(),
              ),
            ),
          ),
          new Divider(
            height: 1,
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.phone,
              size: 25,
              // color: Colors.blue,
            ),
            title: Text(
              "CONTACTS",
              style: TextStyle(
                fontSize: 18,
                // color: Colors.blue,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => Contacts(),
              ),
            ),
          ),
          new Divider(
            height: 1,
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
