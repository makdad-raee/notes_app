import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/cubits/states.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});
  //bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<NotesCubit, NoteState>(
        listener: (context, state) {
          if (state is ADDNoteErrorState) {
            print('Faild${state.errorMessages}');
          }
          if (state is ADDNoteSucceesState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is ADDNoteLoadingState ? true : false,
              child: const SingleChildScrollView(child: AddNoteForm()));
        },
      ),
    );
  }
}
