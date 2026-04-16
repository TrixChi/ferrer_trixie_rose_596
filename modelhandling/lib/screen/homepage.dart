import 'package:flutter/material.dart';
import 'package:modelhandling/model/user.dart';
import 'package:modelhandling/controller/usercontroller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  List<User> users = [];
  final controller = UserController();

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final data = await controller.getUsers();
    setState(() {
      users = data;
    });
  }

  // adding user
  void addUser() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      return;
    }
    final user = User(name: nameController.text, email: emailController.text);

    await controller.addUser(user);
    nameController.clear();
    emailController.clear();
    loadUser();
  }

  // delete user
  void deleteUser(int id) async {
    await controller.deleteUser(id);
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Form Add User
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Name"),
          ),

          SizedBox(height: 20),

          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Email"),
          ),

          ElevatedButton(
            onPressed: () {
              addUser();
            },
            child: Text("Add User"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    onPressed: () {
                      deleteUser(user.id!);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
