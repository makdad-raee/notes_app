import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/cubits/states.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});
  //bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NoteState>(listener: (context, state) {
      if (state is ADDNoteErrorState) {
        print('Faild${state.errorMessages}');
      }
      if (state is ADDNoteSucceesState) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return AbsorbPointer(
        absorbing: state is ADDNoteLoadingState ? true : false,
        child: Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const SingleChildScrollView(
            child: AddNoteForm(),
          ),
        ),
      );
    });
  }
}
