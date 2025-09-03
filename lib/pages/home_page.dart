import 'package:flutter/material.dart';

class Contact {
  final String name;

  Contact({
    required this.name,
  });
}

class ContactBook {
  ContactBook._sharedInstance();

  static final ContactBook _shared = ContactBook._sharedInstance();

  factory ContactBook() => _shared;

  final List<Contact> _contacts = [];

  int get length => _contacts.length;

  void add({required Contact contact}) {
    _contacts.add(contact);
  }

  void remove({required Contact contact}) {
    _contacts.remove(contact);
  }

  Contact? contact({required int atIndex}) =>
      _contacts.length > atIndex ? _contacts[atIndex] : null;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactBook = ContactBook();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: contactBook.length,
        itemBuilder: (context, index) {
          final contact = contactBook.contact(atIndex: index)!;
          return ListTile(
            title: Text(contact.name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.of(context).pushNamed('/new-contact');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
