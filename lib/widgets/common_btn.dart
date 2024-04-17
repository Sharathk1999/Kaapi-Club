import 'package:flutter/material.dart';

class CommonBtn extends StatelessWidget {
  final String btnName;
  final IconData iconData;
  
  const CommonBtn({super.key, required this.btnName, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.onBackground,
        ),
        padding: const EdgeInsets.all(15.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(iconData,color: Theme.of(context).colorScheme.primary,),
            const SizedBox(width: 5,),
            Text(btnName,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black,),), 
          ],
        ),
       );
  }
}