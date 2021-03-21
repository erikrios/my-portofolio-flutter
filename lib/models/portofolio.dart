import 'package:my_portofolio_flutter/models/contact.dart';

import 'project.dart';
import 'role.dart';

class Portofolio {
  String name;
  String introduction;
  String resume;
  List<Role> roles;
  List<Project> projects;
  List<Contact> contacts;

  Portofolio(
      {required this.name,
      required this.introduction,
      required this.resume,
      required this.roles,
      required this.projects,
      required this.contacts});

  factory Portofolio.fromJson(Map<String, dynamic> json) {
    return Portofolio(
        name: json['name'],
        introduction: json['introduction'],
        resume: json['resume'],
        roles: json['specializing'],
        projects: json['projects'],
        contacts: json['contacts']);
  }
}
