# Add Note Cubit 

## Add Note Cubit States

they are AddNoteInitial , AddNoteSuccess , AddNoteLoading and AddNoteFailure

they represents all States Add note Cubit , and these states will use in cubit 


## Add Note Cubit (Function) 

this is Function will use to add note to AddNoteView

it accepts NoteModel (note) 

when we start to use this Function will emit (LoadingState)

after it will try to initilize the box from Hive to storage NoteModelS (notesBox)

we will use add from notesBox to add note and emit (SuccessState) 

if happen any error will emit(FaliureState) with its error message

-------------------------


# Notes Cubit 


## Notes Cubit States

they are NotesInitial , NotesSuccess , NotesLoading and NotesFailure

they represents all States note Cubit , and these states will use in cubit 

## Notes Cubit 'fetch all data' (Function)

this Function is used to fetch the data from storage and update the views or the lists which contain the Notes

we create null-able list (notes) and pointer (hiveBox) to reverse the hiveBox which contains the notes 

we convert the value in the hiveBox to list and put it in notes and emit the NotesSuccess with the notesList to refresh and update the NotesList in anywhere 


---------------------------



# Add Note View


## Custom Text Field

1 - we create hint(String) , maxLines(int) , validator ( dynamic Function(String?) ) and onSaved ( Function(String?) )

2 - in build method we return TextFormField so we use its attribute 

3 - we set hint (variables) to attribute hint and maxLines(variables) to maxLines to determine how many lines the form will allow

4 - we set Function validator to check if the value in the field is null or empty , it will return error message that show to user and in this case it will show ( " this field is required " )

5 - we set Function onSaved to set the value in this form to variable 

## Add Note Form 

1 - we use Form widget to use its attribute such as key , autoValidate and etc..

2 - we create variables ( title , subTitle ) to use in NoteModel so we convert the add note form to stateFulWidget

3 - we create gKey (Global key) to access to the state of the form 

4 - we create autovalidateMode (AutovalidateMode) to convert the state form validate and we set default value is disabled and convert to always validate if happen error in full the form 

5 - saved the value of title and subTitle from customFormField from onSaved Function

6 - in Add (CustomButton) we put the operation to add note to notesBox (Box from Hive) 

7 - in Add button in onTap we check if the form validate about the all field are full , we use gKey to convert the current to save state and initilaze noteModel (NoteModel) and full its attribute by the variables which we initilaze (title , subTitle) and give noteModel another attribute (date , color)

8 - after that we call the AddNote Function by 
BlocProvider.of<AddNoteCubit>(context).addNote(noteModel) ; 
we use BlocProvider class to call of<> (context) Function this determine from any class we will call the Function which we use so we determine AddNoteCubit to call addNote() Function and pass it the noteModel to add it in box of NoteModel

9 - if the validation return false we set the autoValidateMode to always to notice the user to full the field and use setState to rebuild the screen with the new notice 


------------------------



## Add Note Button Sheet 

### BlocProvider

 1 - it provides the AddNoteCubit in this widgets tree by attribute is named create { (context) => AddNoteCubit(AddNoteinitial) }

### BlocConsumer

 1 - Listens to state changes from the AddNoteCubit and builds the UI accordingly . It has two main callbacks
 ( Listner and Builder ) 
   #### Listner 
    Reacts to state changes without rebuilding the UI. The listener callback is triggered whenever a new state is emitted

    in Listner if the add NoteSuccess was emited the addNoteBottomSheet will pop from screen 

   #### Builder
    Rebuilds the UI based on the state. This is where the main UI rendering logic is placed.

    in the Builder we use AbsorbPointer this widget use to stop the pointer of user when emit NotesLoading

    we put the AddNoteForm in padding but in bottom padding we use MediaQuery.of(context).viewInsets.bottom to give us the size of the keyboard will shown in the bottom so when the keyboard will shown the padding widget will give the AddNoteForm padding from the bottom so to up the AddNoteForm when the padding get and allow Scroll to the form if it has many of field , we use SingleChildScrollView 


-------------------------------



# Note Item

## ListTile

1 - it is built-in widget that allow us to create list predefined with custom view and we put it in container to determine the height and width of listTile and put the container in GesturDetector to allow user to click on the note to Edit 

2 - it has some attribute that build to organize the view such (title , subTitle , trairling and etc.. )

3 - title used to show primary content in ListTile and subTitle used to display additional content 

4 - trailing used to put icon in the right of the listTile and we can put another widgets by child of container 
in our case we put delete (IconButton)


## Logic of Delete

1 - in its onPressed , we use the delete method to delete node from storage and the delete method that we get it by extends the Hive object to the NoteModel 

2 - after we delete the note from the storage we refresh and update the notesList by fetchAllData (NotesCubit)

