part of 'contacts_bloc.dart';

enum ContactPageStatus { loading, success, fetchError, otherRequestError }

class ContactsState extends Equatable {
  final ContactPageStatus status;
  final int contactsLimit;
  final List<Contact> contacts;
  final String firstName;
  final String lastName;
  final String email;
  final String errorMessage;
  const ContactsState(
      {required this.status,
      required this.contactsLimit,
      required this.contacts,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.errorMessage});

  @override
  List<Object> get props => [contactsLimit, contacts, firstName, lastName, email];

  ContactsState copyWith(
          {ContactPageStatus? status, int? contactsLimit, List<Contact>? contacts, String? firstName, String? lastName, String? email, String? errorMessage}) =>
      ContactsState(
          status: status ?? this.status,
          contactsLimit: contactsLimit ?? this.contactsLimit,
          contacts: contacts ?? this.contacts,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          errorMessage: errorMessage ?? this.errorMessage);
}
