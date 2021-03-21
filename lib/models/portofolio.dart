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
    var roles = json['specializing'] as List;
    var projects = json['projects'] as List;
    var contacts = json['contacts'] as List;
    return Portofolio(
        name: json['name'],
        introduction: json['introduction'],
        resume: json['resume'],
        roles: roles.map((role) => Role.fromJson(role)).toList(),
        projects: projects.map((project) => Project.fromJson(project)).toList(),
        contacts:
            contacts.map((contact) => Contact.fromJson(contact)).toList());
  }
}
