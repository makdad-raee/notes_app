import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_appr.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppar(title: 'Edit Note', icon: Icons.check),
          CustomTextField(hint: 'Title'),
          CustomTextField(hint: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
