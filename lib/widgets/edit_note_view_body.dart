import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_colors_list_view.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key , required this.note});
  final NoteModel note ; 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomForm(note: note ),
      ),
    );
  }
}



class CustomForm extends StatefulWidget {
  final NoteModel note;
  const CustomForm({
    super.key,
    required this.note,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
         CustomAppBar(
          onTap: (){
            widget.note.title = title ?? widget.note.title ;
            widget.note.subTitle = subTitle ?? widget.note.subTitle ;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllData(); 
            Navigator.pop(context) ;
          },
          title: 'Edit Note',
          icon: Icons.check,
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextField(
          hint: widget.note.title,
          onChanged: (value) {
            title = value;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          hint: widget.note.subTitle,
          maxLines: 5,
          onChanged: (value) {
            subTitle = value;
          },
        ),

         EditColorsListView(note: widget.note) ,
      ],
    );
  }
}
