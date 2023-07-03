import 'package:flutter/material.dart';

void main() {
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('Rakibull Haque', 'rakibull74@.com', '01789568741'),
    Contact('Nirob Vaiya', 'nirob745@.com', '01786957423'),
    Contact('Boro Khala', 'rohima745@gamil.com', '01783697451'),
    Contact("mama", "roton745@gmail.com", "01789546987")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: Icon(Icons.keyboard_arrow_right),
            leading: CircleAvatar(
              child: Text(contacts[index].name.substring(0, 1)),
            ),
            title: Text(contacts[index].name),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              const SizedBox(height: 8.0),
              Text('Phone: ${contact.phone}'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Dismiss the bottom sheet
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phone;

  Contact(this.name, this.email, this.phone);
}
