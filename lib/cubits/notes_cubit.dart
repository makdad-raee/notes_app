import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/states.dart';
import 'package:notes_app/models/notesmodel.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteIntialState());
  addNote(NotesModel note) {}
}
