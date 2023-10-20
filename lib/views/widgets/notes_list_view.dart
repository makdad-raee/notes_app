import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/cubits/states.dart';
import 'package:notes_app/models/notesmodel.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  final data = const [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<NotesCubit, NoteState>(
          builder: (context, state) {
            List<NotesModel> notes =
                BlocProvider.of<NotesCubit>(context).notes ?? [];
            return ListView.builder(
                itemCount: notes.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: NoteItem(note: notes[index]),
                  );
                });
          },
        ),
      ),
    );
  }
}
