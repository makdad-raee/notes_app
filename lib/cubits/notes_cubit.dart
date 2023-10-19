import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/states.dart';
import 'package:notes_app/models/notesmodel.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteIntialState());

  addNote(NotesModel note) async {
    emit(ADDNoteLoadingState());
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);
      await notesBox.add(note);

      emit(ADDNoteSucceesState());
    } catch (e) {
      emit(ADDNoteErrorState(errorMessages: e.toString()));
    }
  }

  fetchAllNotes() async {
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);

      List<NotesModel> notes = notesBox.values.toList();

      emit(
        ReadNoteSucceesState(notes: notes),
      );
    } catch (e) {
      emit(ReadNoteErrorState(errorMessages: e.toString()));
    }
  }
}
