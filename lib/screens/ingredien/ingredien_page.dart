import 'package:flutter/material.dart';


class IngredienPage extends StatefulWidget {
  @override
  _IngredienPageState createState() => _IngredienPageState();
}

class _IngredienPageState extends State<IngredienPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }
  //il ferme la base de donner
 /* @override
  void dispose() {

    NotesDatabase?.instance.close();

    super.dispose();
  }*/


  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:Appbare('Agenda', actions: []),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : notes.isEmpty
                  ? Text(
                      'pas Notes',
                      style: kLabelTextStyle,
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue.shade900,
          child: Icon(Icons.add,color: Colors.white,),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNotePage()),
            );

            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteId: note.id!),

              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),

          );
        },
      );
}
