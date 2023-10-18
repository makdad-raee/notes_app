import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/models/notesmodel.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox<NotesModel>(kNotesBox);
  Hive.registerAdapter(NotesModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesCubit>(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(),
        ),
        home: const NotesViews(),
      ),
    );
  }
}
