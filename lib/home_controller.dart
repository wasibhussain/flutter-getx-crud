import 'package:get/get.dart';

import 'crud_model.dart';


class HomeController extends GetxController {
  final RxList<DummyList> usersData = [
    DummyList(name: 'user1', email: 'user1@gmail.com', dob: '22'),
    DummyList(name: 'user2', email: 'user1@gmail.com', dob: '22'),
    DummyList(name: 'user3', email: 'user1@gmail.com', dob: '22'),
    DummyList(name: 'user4', email: 'user1@gmail.com', dob: '22'),
    DummyList(name: 'user5', email: 'user1@gmail.com', dob: '22'),
    DummyList(name: 'user6', email: 'user1@gmail.com', dob: '22'),
    DummyList(name: 'user7', email: 'user1@gmail.com', dob: '22')
  ].obs;
}
