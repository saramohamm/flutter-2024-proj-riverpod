import 'package:flutter/material.dart';
import 'package:flutterproject/presentation/screen/AddUserPage.dart';
import 'package:flutterproject/presentation/screen/UpdateUserPage.dart';

import '../../models/users.dart';

void main() {
  runApp(MaterialApp(
    title: 'User Management App',
    home: AdminPage(),
  ));
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<User> users = [
    User(name: 'abebe', email: 'abebe.com', isApproved: true),
    User(name: 'aster', email: 'aster.com', isApproved: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue,
              child: ListTile(
                title: Text(
                  users[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Email: ${users[index].email}\n'
                  'Status: ${users[index].isApproved ? "Approved" : "Pending"}',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateUserPage(user: users[index]),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          users.removeAt(index);
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(users[index].isApproved ? Icons.close : Icons.check),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          users[index] = User(
                            name: users[index].name,
                            email: users[index].email,
                            isApproved: !users[index].isApproved,
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUserPage(),
            ),
          );
        },
        label: Text('Add User'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}//////
