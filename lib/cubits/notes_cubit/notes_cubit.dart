import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(super.NotesIntiail);
   List<NoteModel>? notes ;
  fetchAllData(){
   
  var notesBox = Hive.box<NoteModel>(kNotesBox);
   notes = notesBox.values.toList() ; 
   emit(NotesSuccess(notes: notes) );
  
  }

}