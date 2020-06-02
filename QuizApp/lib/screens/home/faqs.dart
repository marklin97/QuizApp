import 'package:flutter/material.dart';

class FAQS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frequent Asked Questions',
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
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
    'FAQS',
    <Entry>[
      Entry(
        'How do I register myself for this app?',
        <Entry>[
          Entry('sample answer'),
        ],
      ),
      Entry(
        'Can I access this app without an internet connection?',
        <Entry>[
          Entry('sample answer'),
        ],
      ),
      Entry(
        'How will  my final score be uploaded to the leaderboard?  Can I see how my understanding compares with others?',
        <Entry>[
          Entry('sample answer'),
        ],
      ),
      Entry(
        'How do I deregister myself from this app?',
        <Entry>[
          Entry('sample answer'),
        ],
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
