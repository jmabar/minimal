import 'package:conda_app/contacts/data/clients/contacts_client.dart';

import '../models/contact.dart';

class ContactsRepository {
  final ContactsClient _contactsClient;
  final String token;

  ContactsRepository({ContactsClient? contactsClient, required this.token}) : _contactsClient = contactsClient ?? ContactsClient();

  Future<List<Contact>> fetchContacts() async {
    final contactsResponse = await _contactsClient.fetchContactsList(token);

    List<Contact> contacts = contactsResponse.response.data
        .map((data) => Contact(
              id: data.id,
              firstName: data.firstname,
              lastName: data.lastname,
              email: data.email,
            ))
        .toList();

    return contacts;
  }

  Future<Contact> addContact(String firstName, String lastName, String email) async {
    final createResponse = await _contactsClient.createContact(firstName, lastName, email, token);
    return Contact(
        id: createResponse.response.id,
        firstName: createResponse.response.firstname,
        lastName: createResponse.response.lastname,
        email: createResponse.response.email);
  }

  Future<void> deleteContact(int contactId) async {
    await _contactsClient.deleteContact(contactId, token);
  }

  Future<Contact> editContact(int contactId, String firstName, String lastName, String email) async {
    final createResponse = await _contactsClient.editContact(contactId, firstName, lastName, email, token);
    return Contact(
        id: createResponse.response.id,
        firstName: createResponse.response.firstname,
        lastName: createResponse.response.lastname,
        email: createResponse.response.email);
  }
}
