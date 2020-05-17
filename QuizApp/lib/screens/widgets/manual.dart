import 'package:flutter/material.dart';

class Manual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USER MANUAL',
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
    'INTRODUCTION',
    <Entry>[
      Entry(
        '     Welcome to the New South Wales Police Force Person Search Quiz App. This application is designed for current students at the New South Police Force Academy to reinforce their learning in regards to the topic of searching a person in a Music Festival Environment. \n\n     There are three modes to choose from for the quiz: Easy, Medium and Hard. In each quiz round, you are awarded a certain number of points if you answer correctly. At the end of the quiz, you awarded a total score for how many questions you answered correctly. There is a high score system, wherein the app will keep track of your high score so you can aim to beat it. If you have any further questions about the administrative side of this app, please visit the FAQ tab for more information.',
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
