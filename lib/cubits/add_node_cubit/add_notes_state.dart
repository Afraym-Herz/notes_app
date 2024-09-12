class AddNoteState {} 

class AddNoteinitial extends AddNoteState {}
class AddNoteLoading extends AddNoteState {}
class AddNoteSuccess extends AddNoteState {}
class AddNoteFaliure extends AddNoteState {
  final String errMessage ;
  AddNoteFaliure({required this.errMessage}); 
}
