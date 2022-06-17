import 'package:http/http.dart' as http;

import 'package:conda_app/contacts/data/models/contacts_response.dart';
import 'package:conda_app/contacts/data/models/create_resposne.dart';
import 'package:conda_app/contacts/data/models/delete_response.dart';

class ContactsRequestException implements Exception {
  final String errorMessage;

  ContactsRequestException({required this.errorMessage});
}

class ContactsClient {
  final http.Client _httpClient;

  ContactsClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  final String _baseUrl = 'agency-coda.uc.r.appspot.com';

  //Fetch contact list
  Future<ContactsResponse> fetchContactsList(String token) async {
    final Uri request = Uri.https(_baseUrl, 'client/list');

    final Map<String, String> headers = {'Authorization': 'Bearer $token'};

    final response = await _httpClient.post(request, headers: headers);

    if (response.statusCode != 200) {
      throw ContactsRequestException(errorMessage: 'Unexpected error happened');
    }

    final ContactsResponse contactsResponse = ContactsResponse.fromJson(response.body);

    if (contactsResponse.error != null) {
      throw ContactsRequestException(errorMessage: contactsResponse.error!.message);
    }

    return contactsResponse;
  }

  //Create new contact
  Future<CreateResponse> createContact(String firstName, String lastName, String email, String token) async {
    final Map<String, String> queryParameters = {'firstname': firstName, 'lastname': lastName, 'email': email};

    final request = Uri.https(_baseUrl, 'client/save', queryParameters);

    final Map<String, String> headers = {'Authorization': 'Bearer $token'};

    final response = await _httpClient.post(request, headers: headers);

    if (response.statusCode != 200) {
      throw ContactsRequestException(errorMessage: 'Unexpected error happened');
    }

    final CreateResponse createResponse = CreateResponse.fromJson(response.body);

    if (createResponse.error != null) {
      throw ContactsRequestException(errorMessage: createResponse.error!.message);
    }
    return createResponse;
  }

  //Delete contact
  Future<void> deleteContact(int contactId, String token) async {
    final request = Uri.https(_baseUrl, 'client/remove/$contactId');

    final Map<String, String> headers = {'Authorization': 'Bearer $token'};

    final response = await _httpClient.delete(request, headers: headers);

    if (response.statusCode != 200) {
      throw ContactsRequestException(errorMessage: 'Unexpected error happened');
    }

    final DeleteResponse deleteResponse = DeleteResponse.fromJson(response.body);

    if (deleteResponse.error != null) {
      throw ContactsRequestException(errorMessage: deleteResponse.error!.message);
    }
  }

  //Edit contact
  Future<CreateResponse> editContact(int contactId, String firstName, String lastName, String email, String token) async {
    final Map<String, String> queryParameters = {'id': contactId.toString(), 'firstname': firstName, 'lastname': lastName, 'email': email};

    final request = Uri.https(_baseUrl, 'client/save', queryParameters);

    final Map<String, String> headers = {'Authorization': 'Bearer $token'};

    final response = await _httpClient.post(request, headers: headers);

    if (response.statusCode != 200) {
      throw ContactsRequestException(errorMessage: 'Unexpected error happened');
    }

    final CreateResponse createResponse = CreateResponse.fromJson(response.body);

    if (createResponse.error != null) {
      throw ContactsRequestException(errorMessage: createResponse.error!.message);
    }

    return createResponse;
  }
}
