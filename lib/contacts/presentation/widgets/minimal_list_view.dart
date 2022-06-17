import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login/presentation/widgets/widgets.dart';
import '../../business_logic/contacts_bloc.dart';
import 'contact_widgets.dart';

class MinimalContactsListView extends StatelessWidget {
  const MinimalContactsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            separatorBuilder: (_, __) => const SizedBox(height: 20.0),
            itemCount: state.contactsLimit >= state.contacts.length ? state.contacts.length : state.contactsLimit + 1,
            itemBuilder: (context, i) => state.contactsLimit < state.contacts.length
                ? i != state.contactsLimit
                    ? MinimalListTile(contact: state.contacts[i], contactIndex: i)
                    : MinimalElevatedButton(
                        height: 50,
                        width: 300,
                        buttonLabel: 'LOAD MORE',
                        onPressed: () => context.read<ContactsBloc>().add(OnUpdateContactsLimitEvent()),
                      )
                : MinimalListTile(contact: state.contacts[i], contactIndex: i));
      },
    );
  }
}
