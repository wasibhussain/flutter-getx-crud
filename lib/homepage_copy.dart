// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';

// import 'package:new_test_project/getx_crud/crud_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final dobController = TextEditingController();

//   List<DummyList> usersList = [
//     DummyList(name: 'user1', email: 'user1@gmail.com', dob: '22'),
//     DummyList(name: 'user2', email: 'user1@gmail.com', dob: '22'),
//     DummyList(name: 'user3', email: 'user1@gmail.com', dob: '22'),
//     DummyList(name: 'user4', email: 'user1@gmail.com', dob: '22'),
//     DummyList(name: 'user5', email: 'user1@gmail.com', dob: '22'),
//     DummyList(name: 'user6', email: 'user1@gmail.com', dob: '22'),
//     DummyList(name: 'user7', email: 'user1@gmail.com', dob: '22')
//   ];

//   bottomSheet() {
//     return showModalBottomSheet(
//       context: context,
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 350,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Add User',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(
//                       label: Text('Name'), border: OutlineInputBorder()),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                       label: Text('Email'), border: OutlineInputBorder()),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: dobController,
//                   decoration: const InputDecoration(
//                       label: Text('Date of Birth'),
//                       border: OutlineInputBorder()),
//                 ),
//                 const SizedBox(height: 10),
//                 InkWell(
//                   onTap: () {
//                     usersList.add(DummyList(
//                         name: nameController.text,
//                         email: emailController.text,
//                         dob: dobController.text));
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text("New user added"),
//                     ));
//                     Get.back();
//                     setState(() {
//                       nameController.clear();
//                       emailController.clear();
//                       dobController.clear();
//                     });
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.94,
//                     height: 60,
//                     decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: const Center(
//                         child: Text(
//                       'Add',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     )),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   updateBottomSheet(int index, String name, String email, String dob) {
//     nameController.text = name;
//     emailController.text = email;
//     dobController.text = dob;
//     return showModalBottomSheet(
//       context: context,
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 350,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Update User',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(
//                       label: Text('Name'), border: OutlineInputBorder()),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                       label: Text('Email'), border: OutlineInputBorder()),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: dobController,
//                   decoration: const InputDecoration(
//                       label: Text('Date of Birth'),
//                       border: OutlineInputBorder()),
//                 ),
//                 const SizedBox(height: 10),
//                 InkWell(
//                   onTap: () {
//                     final existingItem = usersList
//                         .firstWhere((element) => element == usersList[index]);
//                     existingItem.name = nameController.text;
//                     existingItem.email = emailController.text;
//                     existingItem.dob = dobController.text;
//                     setState(() {});
//                     DummyList(
//                         name: nameController.text,
//                         email: emailController.text,
//                         dob: dobController.text);

//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text("New user updated"),
//                     ));
//                     Get.back();
//                     setState(() {
//                       nameController.clear();
//                       emailController.clear();
//                       dobController.clear();
//                     });
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.94,
//                     height: 60,
//                     decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: const Center(
//                         child: Text(
//                       'Update',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     )),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Widget Rebuild');
//     return Scaffold(
//       appBar: AppBar(title: Text('Hive DB'), centerTitle: true,),
//       body: usersList.isEmpty
//           ? const Center(child: Text('No Data'))
//           : ListView.builder(
//               itemCount: usersList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     child: Text(usersList[index].dob),
//                   ),
//                   title: Text(usersList[index].name),
//                   subtitle: Text(usersList[index].email),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             updateBottomSheet(index, usersList[index].name,
//                                 usersList[index].email, usersList[index].dob);
//                           },
//                           icon: const Icon(Icons.edit)),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               usersList.removeAt(index);
//                             });
//                           },
//                           icon: const Icon(Icons.delete)),
//                     ],
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: bottomSheet,
//       ),
//     );
//   }
// }
