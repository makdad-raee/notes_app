import 'package:flutter/material.dart';
import 'package:notes_app/models/notesmodel.dart';
import 'package:notes_app/views/widgets/edit_not_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note: note),
    );
  }
}
