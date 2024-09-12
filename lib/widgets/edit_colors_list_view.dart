import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';

class EditColorsListView extends StatefulWidget {
  const EditColorsListView({super.key, required this.note});
  final NoteModel note ; 

  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {
  late int currentIndex ;

  @override
  void initState() {
    super.initState();
    currentIndex = kColorsList.indexOf(Color(widget.note.color)) ;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kColorsList[currentIndex].value ;
              setState((){});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ColorItem(
                color: kColorsList[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}