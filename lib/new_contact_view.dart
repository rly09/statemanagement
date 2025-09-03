import 'package:flutter/material.dart';
import 'package:vanillacontacts_course/pages/home_page.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new contact"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter a name",
            ),
          ),
          TextButton(
            onPressed: () {
              final contact = Contact(name: _controller.text);
              ContactBook().add(contact: contact);
              Navigator.of(context).pop();
            },
            child: Text("Add Contact"),
          )
        ],
      ),
    );
  }
}
