import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  final data = const [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: NoteItem(),
        );
      }),
    );
  }
}
