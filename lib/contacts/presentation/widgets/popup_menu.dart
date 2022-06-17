import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/contacts_bloc.dart';
import '../../data/models/contact.dart';
import '../pages/modal.dart';

class MinimalPopUpMenu extends StatelessWidget {
  final Contact contact;
  final int contactIndex;
  const MinimalPopUpMenu({Key? key, required this.contact, required this.contactIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (item) => onItemSelected(context, item),
      itemBuilder: (context) => [...MinimalMenuItems.menuItems.map(buildMinimalItem).toList()],
    );
  }

  PopupMenuItem<MinimalMenuItem> buildMinimalItem(MinimalMenuItem item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: item.contentColor, size: 20.0),
            const SizedBox(width: 12.0),
            Text(
              item.label,
              style: TextStyle(color: item.contentColor),
            )
          ],
        ),
      );

  void onItemSelected(BuildContext context, Object? item) {
    switch (item) {
      case MinimalMenuItems.editItem:
        showModalBottomSheet(
          context: context,
          builder: (bottomSheetContext) =>
              ModalPage(isEditing: true, title: 'Edit client', contact: contact, contactIndex: contactIndex, contactPageContext: context),
          isScrollControlled: true,
        );
        break;
      case MinimalMenuItems.deleteItem:
        context.read<ContactsBloc>().deleteContact(contactIndex, contact.id);
        break;
    }
  }
}

class MinimalMenuItem {
  final String label;
  final IconData icon;
  final Color contentColor;

  const MinimalMenuItem({required this.label, required this.icon, required this.contentColor});
}

class MinimalMenuItems {
  static const List<MinimalMenuItem> menuItems = [editItem, deleteItem];

  static const MinimalMenuItem editItem = MinimalMenuItem(label: 'Edit', icon: Icons.edit, contentColor: Colors.black);

  static const MinimalMenuItem deleteItem = MinimalMenuItem(label: 'Delete', icon: Icons.delete, contentColor: Colors.red);
}
