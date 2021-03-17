import 'dart:ui';

import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  final double height;

  Contact({required this.height});

  @override
  _ContactState createState() => _ContactState(height: height);
}

class _ContactState extends State<Contact> {
  final double height;

  _ContactState({required this.height});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isNameEmpty = false;
  bool _isEmailEmpty = false;
  bool _isSubjectEmpty = false;
  bool _isMessageEmpty = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 50.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              'Get In Touch'.toUpperCase(),
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Interested in working together?\nFeel free to contact me for any project or collaboration.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset('assets/images/coworking.png'),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: _getTextFieldItem(
                                    controller: _nameController,
                                    maxLines: 1,
                                    labelText: 'Name',
                                    hintText: 'Type your name',
                                    isEmpty: _isNameEmpty,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: _getTextFieldItem(
                                    controller: _emailController,
                                    maxLines: 1,
                                    labelText: 'Email',
                                    hintText: 'Type your email',
                                    isEmpty: _isEmailEmpty,
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              flex: 1,
                              child: _getTextFieldItem(
                                controller: _subjectController,
                                maxLines: 1,
                                labelText: 'Subject',
                                hintText: 'Type subject',
                                isEmpty: _isSubjectEmpty,
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: _getTextFieldItem(
                                controller: _messageController,
                                maxLines: 4,
                                labelText: 'Message',
                                hintText: 'Type message',
                                isEmpty: _isMessageEmpty,
                                alignWithHint: true,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isNameEmpty =
                                        _isEmptyValidate(_nameController);
                                    _isEmailEmpty =
                                        _isEmptyValidate(_emailController);
                                    _isSubjectEmpty =
                                        _isEmptyValidate(_subjectController);
                                    _isMessageEmpty =
                                        _isEmptyValidate(_messageController);
                                  });
                                },
                                child: Text('Send'),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                      vertical: 14.0,
                                      horizontal: 34.0,
                                    ),
                                  ),
                                  textStyle: MaterialStateProperty.all(
                                    TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.blue.shade700,
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextField _getTextFieldItem(
      {required TextEditingController controller,
      required int maxLines,
      required String labelText,
      required String hintText,
      alignWithHint = false,
      required bool isEmpty}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true,
        errorText: isEmpty ? "This field must not be empty" : null,
        fillColor: Colors.grey.shade200,
        alignLabelWithHint: alignWithHint,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Colors.blue.shade700,
        ),
      ),
    );
  }

  bool _isEmptyValidate(TextEditingController controller) {
    return controller.text.isEmpty;
  }
}
