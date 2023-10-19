import 'package:notes_app/models/notesmodel.dart';

class NoteState {}

class NoteIntialState extends NoteState {}

class ADDNoteLoadingState extends NoteState {}

class ADDNoteSucceesState extends NoteState {}

class ADDNoteErrorState extends NoteState {
  final String errorMessages;

  ADDNoteErrorState({required this.errorMessages});
}

class ReadNoteSucceesState extends NoteState {
  final List<NotesModel> notes;

  ReadNoteSucceesState({required this.notes});
}

class EditNoteLoadingState extends NoteState {}

class EditNoteSuccesState extends NoteState {}

class EditNoteErrorState extends NoteState {
  final String errorMessages;

  EditNoteErrorState({required this.errorMessages});
}

class DeletetNoteLoadingState extends NoteState {}

class DeletetNoteSuccesState extends NoteState {}

class DeletetNoteErrorState extends NoteState {
  final String errorMessages;

  DeletetNoteErrorState({required this.errorMessages});
}
