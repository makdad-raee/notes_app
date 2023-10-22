import 'package:flutter/widgets.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/notesmodel.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';

class EditNoteColorLIst extends StatefulWidget {
  const EditNoteColorLIst({super.key, required this.note});
  final NotesModel note;

  @override
  State<EditNoteColorLIst> createState() => _EditNoteColorLIstState();
}

class _EditNoteColorLIstState extends State<EditNoteColorLIst> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kcolors[index].value;

                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index ? true : false,
                color: kcolors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
