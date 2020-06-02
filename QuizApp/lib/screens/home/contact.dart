import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Call Us : (02) 9850 7636",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Email : marklin97@hotmail.com",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            Text(
              "Hours : 8.30am - 5pm",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "            Monday to Friday",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Police Search Manual',
    <Entry>[
      Entry(
        'How do I register myself for this app?',
        <Entry>[
          Entry('sample answer'),
        ],
      ),
    ],
  ),
  Entry(
    'NSW Legislation - Law Enforcement',
    <Entry>[
      Entry(
        'How do I register myself for this app?',
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return Container(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
              title: Text(
            root.title,
            style: TextStyle(
              fontSize: 18,
            ),
          )));
    return Container(
        padding: EdgeInsets.all(8.0),
        child: ExpansionTile(
          key: PageStorageKey<Entry>(root),
          title: Text(
            root.title,
            style: TextStyle(fontSize: 18),
          ),
          children: root.children.map(_buildTiles).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
