
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.hint, required this.onTap});
  final String hint ;
  final Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(
          color: kPrimaryColor ,
          borderRadius: BorderRadius.circular(16) ,
        ),
        child:  Text(hint , style: const TextStyle(color: Colors.black , fontSize: 22 ),),
      ),
    ) ;
  }
}