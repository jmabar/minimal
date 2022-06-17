import 'package:flutter/material.dart';

import '../pages/modal.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
            width: 220,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search...',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
            )),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (bottomSheetContext) => ModalPage(isEditing: false, title: 'Add new client', contactPageContext: context),
              isScrollControlled: true,
            ),
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text('ADD NEW', textAlign: TextAlign.center, style: Theme.of(context).textTheme.button),
          ),
        ),
      ],
    );
  }
}
