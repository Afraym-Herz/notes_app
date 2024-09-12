import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, required this.onTap});
  final IconData icon ; 
  final Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05) ,
          borderRadius: BorderRadius.circular(16) ,
        ),
        child :  GestureDetector(
          onTap: onTap,
          child: Icon(icon , size: 28, ) ,
          ) ,
      ) ,
    ) ;
  }
}