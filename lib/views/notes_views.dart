import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/cubits/states.dart';
import 'package:notes_app/views/widgets/add_note_booton_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NoteState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return const AddNoteBottonSheet();
                },
              );
            },
          ),
          body: const NotesViewBody(),
        );
      },
    );
  }
}
