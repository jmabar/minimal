import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:conda_app/contacts/data/repositories/contacts_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:conda_app/contacts/data/models/contact.dart';

import '../data/clients/contacts_client.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsRepository _contactsRepository;
  ContactsBloc(this._contactsRepository)
      : super(
            const ContactsState(status: ContactPageStatus.loading, contactsLimit: 5, contacts: [], firstName: "", lastName: "", email: "", errorMessage: "")) {
    //Event handlers
    on<OnUpdateContactsLimitEvent>((event, emit) => emit(state.copyWith(contactsLimit: state.contactsLimit + 5)));
    on<OnUpdateFirstNameEvent>((event, emit) => emit(state.copyWith(firstName: event.firstName)));
    on<OnUpdateLastNameEvent>((event, emit) => emit(state.copyWith(lastName: event.lastName)));
    on<OnUpdateEmailEvent>((event, emit) => emit(state.copyWith(email: event.email)));
    on<OnFetchContactsListEvent>((event, emit) => emit(state.copyWith(contacts: event.contacts, status: ContactPageStatus.success)));
    on<OnEditContactModalOpenEvent>((event, emit) => emit(state.copyWith(firstName: event.firstName, lastName: event.lastName, email: event.email)));
    on<OnAddContactModalOpenEvent>((event, emit) => emit(state.copyWith(firstName: "", lastName: "", email: "")));
    on<OnRequestFailureEvent>(((event, emit) => emit(state.copyWith(errorMessage: event.errorMsg, status: event.status))));
  }

  Future<void> deleteContact(int contactIndex, int contactId) async {
    try {
      await _contactsRepository.deleteContact(contactId);
      final List<Contact> newContacts = [...state.contacts];
      newContacts.removeAt(contactIndex);
      add(OnFetchContactsListEvent(newContacts));
    } on ContactsRequestException catch (e) {
      add(OnRequestFailureEvent(errorMsg: 'Failed delete: ${e.errorMessage}', status: ContactPageStatus.otherRequestError));
    } catch (e) {
      add(OnRequestFailureEvent(errorMsg: 'Failed delete: ${e.toString()}', status: ContactPageStatus.otherRequestError));
    }
  }

  Future<void> addContact() async {
    try {
      final Contact contact = await _contactsRepository.addContact(state.firstName, state.lastName, state.email);
      final List<Contact> newContacts = [contact, ...state.contacts];
      add(OnFetchContactsListEvent(newContacts));
    } on ContactsRequestException catch (e) {
      add(OnRequestFailureEvent(errorMsg: 'Adding contact failed: ${e.errorMessage}', status: ContactPageStatus.otherRequestError));
    } catch (e) {
      add(OnRequestFailureEvent(errorMsg: 'Added contact failed: ${e.toString()}', status: ContactPageStatus.otherRequestError));
    }
  }

  //Should not post to DB if the data didnt change and Save button is pressed by the user.
  Future<void> editContact(Contact contact, int contactIndex) async {
    try {
      if (contact.firstName == state.firstName && contact.lastName == state.lastName && contact.email == state.email) {
        return;
      } else {
        final Contact editedContact = await _contactsRepository.editContact(contact.id, state.firstName, state.lastName, state.email);
        final List<Contact> editedContacts = [...state.contacts];
        editedContacts[contactIndex] = editedContact;
        add(OnFetchContactsListEvent(editedContacts));
      }
    } on ContactsRequestException catch (e) {
      add(OnRequestFailureEvent(errorMsg: 'Failed edit: ${e.errorMessage}', status: ContactPageStatus.otherRequestError));
    } catch (e) {
      add(OnRequestFailureEvent(errorMsg: 'Failed edi: ${e.toString()}', status: ContactPageStatus.otherRequestError));
    }
  }

  Future<void> fetchContacts() async {
    try {
      final List<Contact> contacts = await _contactsRepository.fetchContacts();
      add(OnFetchContactsListEvent(contacts));
    } on ContactsRequestException catch (e) {
      add(OnRequestFailureEvent(errorMsg: e.errorMessage, status: ContactPageStatus.fetchError));
    } catch (e) {
      add(OnRequestFailureEvent(errorMsg: e.toString(), status: ContactPageStatus.fetchError));
    }
  }
}
