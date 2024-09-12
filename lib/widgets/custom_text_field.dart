import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxLines = 1, this.onSaved, this.validator, this.onChanged });
  final String hint ; 
  final int maxLines ;
  final dynamic Function(String?)? validator ;
  final Function(String?)? onSaved ;
  final Function(String?)? onChanged ;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: TextFormField(
        validator: (value){
          if (value?.isEmpty ?? true ){
            return 'this field is required' ;
          }
          else {
            return null ;
          }
        } ,
        onSaved: onSaved ,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: kPrimaryColor),
          enabledBorder: buildBorder(),
          border: buildBorder() ,
          focusedBorder: buildBorder( color:  kPrimaryColor),
        ),
      ),
    ) ;
  }

  OutlineInputBorder buildBorder({color}) {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8) ,
          borderSide:  BorderSide(
          color: color ?? Colors.white  ,
        ) ,
        );
  }
}

