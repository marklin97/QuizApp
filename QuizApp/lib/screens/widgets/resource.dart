import 'package:flutter/material.dart';
import 'package:link/link.dart';

class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showErrorSnackBar() {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Oops... the URL couldn\'t be opened!'),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Resources',
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Person Search Manual',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Link(
                  child: Text(
                    'This is a link  to Person Search Manual ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      decoration:
                          TextDecoration.underline, // add add underline in text
                    ),
                  ),
                  url:
                      'https://www.police.nsw.gov.au/about_us/policies_procedures_and_legislation#letter_P',
                  onError: _showErrorSnackBar,
                ),
                Divider(
                  height: 100,
                  color: Colors.blue,
                  thickness: 2,
                ),
                Text(
                  'NSW Legislation - Law Enforcement',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Link(
                  child: Text(
                    'This is a link  to NSW Legistlation ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      decoration:
                          TextDecoration.underline, // add add underline in text
                    ),
                  ),
                  url:
                      'https://www.legislation.nsw.gov.au/#/view/act/2002/103/whole',
                  onError: _showErrorSnackBar,
                ),
                Divider(
                  height: 100,
                  color: Colors.blue,
                  thickness: 2,
                ),
              ],
            )));
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
