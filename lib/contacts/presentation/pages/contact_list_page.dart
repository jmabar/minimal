import 'package:conda_app/contacts/presentation/pages/contact_list_refetch.dart';
import 'package:conda_app/contacts/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/contacts_bloc.dart';
import '../widgets/contact_widgets.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  void initState() {
    super.initState();
    context.read<ContactsBloc>().fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        switch (state.status) {
          case ContactPageStatus.loading:
            return const ContactListLoadingPage();
          case ContactPageStatus.success:
            return _buildContactList(context, "");
          case ContactPageStatus.fetchError:
            return ContactListReFetchPage(error: state.errorMessage);
          case ContactPageStatus.otherRequestError:
            return _buildContactList(context, state.errorMessage);
        }
      },
    );
  }
}

Widget _buildContactList(BuildContext context, String errorMessage) {
  return SafeArea(
    child: Scaffold(
      body: Stack(
        children: [
          const ContactBackgroundDecoration(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20.0),
                Text('minimal', style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center),
                const SizedBox(height: 20.0),
                Text('CLIENTS', style: Theme.of(context).textTheme.headline3),
                const SizedBox(height: 30.0),
                const SearchWidget(),
                errorMessage == "" ? Container() : Text(errorMessage, style: const TextStyle(color: Colors.red)),
                const Expanded(child: MinimalContactsListView()),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
