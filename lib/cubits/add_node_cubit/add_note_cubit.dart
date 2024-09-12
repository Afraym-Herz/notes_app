import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_node_cubit/add_notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  AddNoteCubit(super.AddNoteinitial);

  Color color = Colors.red ;
  addNote(NoteModel note) async {
    note.color = color.value ;
    emit(AddNoteLoading()) ;
    try {
  var notesBox = Hive.box<NoteModel>(kNotesBox);
  await notesBox.add(note) ;  
  emit(AddNoteSuccess()) ;
}  catch (e) {
  emit(
    AddNoteFaliure(errMessage: e.toString()) 
  );
}
  }

}