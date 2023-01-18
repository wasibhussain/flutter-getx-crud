import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'crud_model.dart';
import 'home_controller.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());
  final homeController = Get.find<HomeController>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // List<DummyList> usersList = [
  //   DummyList(name: 'user1', email: 'user1@gmail.com', dob: '22'),
  //   DummyList(name: 'user2', email: 'user1@gmail.com', dob: '22'),
  //   DummyList(name: 'user3', email: 'user1@gmail.com', dob: '22'),
  //   DummyList(name: 'user4', email: 'user1@gmail.com', dob: '22'),
  //   DummyList(name: 'user5', email: 'user1@gmail.com', dob: '22'),
  //   DummyList(name: 'user6', email: 'user1@gmail.com', dob: '22'),
  //   DummyList(name: 'user7', email: 'user1@gmail.com', dob: '22')
  // ];

  createUserBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.03,
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add User',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    label: Text('Name'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    label: Text('Email'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                    label: Text('Date of Birth'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  homeController.usersData.add(DummyList(
                      name: nameController.text,
                      email: emailController.text,
                      dob: dobController.text));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("New user added"),
                  ));
                  Get.back();
                  setState(() {
                    nameController.clear();
                    emailController.clear();
                    dobController.clear();
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  updateBottomSheet(int index, String name, String email, String dob) {
    nameController.text = name;
    emailController.text = email;
    dobController.text = dob;
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.03,
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Update User',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    label: Text('Name'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    label: Text('Email'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                    label: Text('Date of Birth'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  final existingItem = homeController.usersData.firstWhere(
                      (element) => element == homeController.usersData[index]);
                  existingItem.name = nameController.text;
                  existingItem.email = emailController.text;
                  existingItem.dob = dobController.text;
                  // setState(() {});
                  DummyList(
                      name: nameController.text,
                      email: emailController.text,
                      dob: dobController.text);

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("New user updated"),
                  ));
                  Get.back();
                  setState(() {
                    nameController.clear();
                    emailController.clear();
                    dobController.clear();
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Update',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Widget Rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive DB'),
        centerTitle: true,
      ),
      body: homeController.usersData.isEmpty
          ? const Center(child: Text('No Data'))
          : Obx(
              (() => ListView.builder(
                    itemCount: homeController.usersData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(homeController.usersData[index].dob),
                        ),
                        title: Text(homeController.usersData[index].name),
                        subtitle: Text(homeController.usersData[index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  updateBottomSheet(
                                      index,
                                      homeController.usersData[index].name,
                                      homeController.usersData[index].email,
                                      homeController.usersData[index].dob);
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    homeController.usersData.removeAt(index);
                                  });
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      );
                    },
                  )),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createUserBottomSheet,
      ),
    );
  }
}
