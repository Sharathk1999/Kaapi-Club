import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Theme.of(context).colorScheme.primaryContainer,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        print("Search value => $value");
                      },
                      decoration: const InputDecoration(
                        hintText: "search contact",
                        prefixIcon: Icon(CupertinoIcons.search,),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}