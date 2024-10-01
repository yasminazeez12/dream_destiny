import 'package:flutter/material.dart';

class Genderbutton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback ontap;
    
  const Genderbutton({
    required this.label,
    required this.selected,
    required this.ontap,
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8
        ),
        decoration: BoxDecoration(
          color: selected?
          Colors.blue:Colors.grey,
          borderRadius: BorderRadius.circular(24)
        ),
        child: Text(label,style: TextStyle(color: selected?Colors.white:Colors.black),),
      ),
    );
  }
}