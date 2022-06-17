part of 'contacts_bloc.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}

class OnUpdateContactsLimitEvent extends ContactsEvent {}

class OnFetchContactsListEvent extends ContactsEvent {
  final List<Contact> contacts;
  const OnFetchContactsListEvent(this.contacts);
}

class OnDeleteContactEvent extends ContactsEvent {
  final int deletedIndex;
  const OnDeleteContactEvent(this.deletedIndex);
}

class OnAddContactEvent extends ContactsEvent {}

class OnEditContactEvent extends ContactsEvent {
  final int editedIndex;
  const OnEditContactEvent(this.editedIndex);
}

class OnUpdateFirstNameEvent extends ContactsEvent {
  final String firstName;
  const OnUpdateFirstNameEvent(this.firstName);
}

class OnUpdateLastNameEvent extends ContactsEvent {
  final String lastName;
  const OnUpdateLastNameEvent(this.lastName);
}

class OnUpdateEmailEvent extends ContactsEvent {
  final String email;
  const OnUpdateEmailEvent(this.email);
}

class OnEditContactModalOpenEvent extends ContactsEvent {
  final String firstName;
  final String lastName;
  final String email;
  const OnEditContactModalOpenEvent({required this.firstName, required this.lastName, required this.email});
}

class OnAddContactModalOpenEvent extends ContactsEvent {}

class OnRequestFailureEvent extends ContactsEvent {
  final String errorMsg;
  final ContactPageStatus status;
  const OnRequestFailureEvent({required this.errorMsg, required this.status});
}
