import 'package:dream_destiny/genderbutton.dart';
import 'package:flutter/material.dart';

class Gendertoggle extends StatefulWidget {
  const Gendertoggle({super.key});

  @override
  State<Gendertoggle> createState() => _GendertoggleState();
}

class _GendertoggleState extends State<Gendertoggle> {
  bool isMale=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Genderbutton(label: 'male', selected: !isMale, ontap: () {
            setState(() {
              isMale=true;
            });
          },),
        ),
        SizedBox(width: 16,),
        Genderbutton(label: 'female', selected: !isMale, ontap:() {
          setState(() {
            isMale=false;
          });
          
        },
        )
      ],
    );
  }
}

