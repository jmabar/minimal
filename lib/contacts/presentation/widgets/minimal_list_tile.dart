import 'package:flutter/material.dart';

import '../../data/models/contact.dart';
import 'popup_menu.dart';

class MinimalListTile extends StatelessWidget {
  final Contact contact;
  final int contactIndex;
  const MinimalListTile({Key? key, required this.contact, required this.contactIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), border: Border.all(), color: Colors.white),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.image),
        ),
        title: Text('${contact.firstName} ${contact.lastName}', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(contact.email),
        trailing: MinimalPopUpMenu(contact: contact, contactIndex: contactIndex),
      ),
    );
  }
}
