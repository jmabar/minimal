import 'package:conda_app/contacts/presentation/widgets/contact_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login/presentation/widgets/widgets.dart';
import '../../business_logic/contacts_bloc.dart';
import '../../data/models/contact.dart';

class ModalPage extends StatefulWidget {
  final bool isEditing;
  final String title;
  final BuildContext contactPageContext;
  final int? contactIndex;
  final Contact? contact;
  const ModalPage({
    Key? key,
    required this.isEditing,
    required this.title,
    required this.contactPageContext,
    this.contactIndex,
    this.contact,
  }) : super(key: key);

  @override
  State<ModalPage> createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  //Global key para identificar al form
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.isEditing
        ? widget.contactPageContext.read<ContactsBloc>().add(OnEditContactModalOpenEvent(
              firstName: widget.contact!.firstName,
              lastName: widget.contact!.lastName,
              email: widget.contact!.email,
            ))
        : widget.contactPageContext.read<ContactsBloc>().add(OnAddContactModalOpenEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 34.0),
                child: Text(widget.title, style: Theme.of(context).textTheme.headline4),
              ),
              const SizedBox(height: 29.0),
              Container(
                color: const Color.fromARGB(253, 253, 249, 230),
                padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 20.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MinimalCircleAvatar(),
                    TextFormField(
                      validator: (input) => _validateAnyName(input, 'First Name'),
                      initialValue: widget.isEditing ? widget.contact!.firstName : null,
                      decoration: !widget.isEditing ? const InputDecoration(labelText: 'First Name*') : null,
                      onChanged: (String? value) => widget.contactPageContext.read<ContactsBloc>().add(OnUpdateFirstNameEvent(value!)),
                    ),
                    TextFormField(
                      validator: (input) => _validateAnyName(input, 'Last Name'),
                      initialValue: widget.isEditing ? widget.contact!.lastName : null,
                      decoration: !widget.isEditing ? const InputDecoration(labelText: 'Last Name*') : null,
                      onChanged: (String? value) => widget.contactPageContext.read<ContactsBloc>().add(OnUpdateLastNameEvent(value!)),
                    ),
                    TextFormField(
                      validator: (input) => _validateEmail(input),
                      initialValue: widget.isEditing ? widget.contact!.email : null,
                      decoration: !widget.isEditing ? const InputDecoration(labelText: 'Email address*') : null,
                      onChanged: (String? value) => widget.contactPageContext.read<ContactsBloc>().add(OnUpdateEmailEvent(value!)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                    ),
                    MinimalElevatedButton(height: 40, width: 160, buttonLabel: 'SAVE', onPressed: () => _validateForm()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? input) {
    if (input == null) {
      return 'Email required';
    } else if (RegExp(
            r"(^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$)")
        .hasMatch(input)) {
      return null;
    }
    return 'Invalid email';
  }

  String? _validateAnyName(String? input, String label) {
    if (input == null || input == "") {
      return '$label required';
    }
    return null;
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      widget.isEditing
          ? widget.contactPageContext.read<ContactsBloc>().editContact(widget.contact!, widget.contactIndex!)
          : widget.contactPageContext.read<ContactsBloc>().addContact();
      Navigator.of(context).pop();
    }
  }
}
