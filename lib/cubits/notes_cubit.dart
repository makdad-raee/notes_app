import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/states.dart';
import 'package:notes_app/models/notesmodel.dart';
import 'package:flutter/material.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteIntialState());
  Color color = const Color(0xffFC6262);

  addNote(NotesModel note) async {
    note.color = color.value;
    emit(ADDNoteLoadingState());
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);
      await notesBox.add(note);

      emit(ADDNoteSucceesState());
    } catch (e) {
      emit(ADDNoteErrorState(errorMessages: e.toString()));
    }
  }

  List<NotesModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NotesModel>(kNotesBox);

    notes = notesBox.values.toList();

    emit(
      ReadNoteSucceesState(notes: notes!),
    );
  }
}
