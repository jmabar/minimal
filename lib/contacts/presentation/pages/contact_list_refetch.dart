import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/contacts_bloc.dart';
import '../widgets/contact_widgets.dart';

class ContactListReFetchPage extends StatelessWidget {
  final String error;
  const ContactListReFetchPage({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const ContactBackgroundDecoration(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Text('minimal', style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center),
                    const SizedBox(height: 20.0),
                    Text('CLIENTS', style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 30.0),
                    const SearchWidget(),
                    const SizedBox(height: 160.0),
                    Text(error, style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        onPressed: () => context.read<ContactsBloc>().fetchContacts(),
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text('Refresh')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
