import 'package:flutter/material.dart';

class NewContactTile extends StatelessWidget {
  final IconData iconData;
  final String btnName;
  final VoidCallback onTap;

  const NewContactTile({super.key, required this.iconData, required this.btnName, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child:  Icon(iconData,color: Theme.of(context).colorScheme.primary,size: 35,),
            ),
            const SizedBox(width: 20.0,),
            Text(btnName,style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ),
    );
  }
}