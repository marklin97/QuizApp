import 'package:flutter/material.dart';
import './setting.dart';
import './faqs.dart';

class DrawerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Container(
            height: height / 2.5,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/darwerbar.jpeg"),
                fit: BoxFit.cover,
              )),
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
        ],
      ),
    );
  }
}
