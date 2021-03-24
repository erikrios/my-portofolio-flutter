import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_state.dart';
import 'package:my_portofolio_flutter/responsive/screen_size.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  final double height;
  final ScreenSize screenSize;

  Contact({required this.screenSize, required this.height});

  @override
  _ContactState createState() => _ContactState(
        screenSize: screenSize,
        height: height,
      );
}

class _ContactState extends State<Contact> {
  final double height;
  final ScreenSize screenSize;

  _ContactState({required this.screenSize, required this.height});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isNameEmpty = false;
  bool _isEmailEmpty = false;
  bool _isSubjectEmpty = false;
  bool _isMessageEmpty = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PortofolioBloc bloc = BlocProvider.of<PortofolioBloc>(context);
    bool isSmallOrNormalScreen =
        screenSize == ScreenSize.SMALL || screenSize == ScreenSize.NORMAL;
    print(isSmallOrNormalScreen);
    print(screenSize);
    return Container(
      height: isSmallOrNormalScreen ? height : height * 5 / 6,
      padding: isSmallOrNormalScreen
          ? EdgeInsets.all(16.0)
          : EdgeInsets.symmetric(
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
                fontSize: isSmallOrNormalScreen ? 28.0 : 40.0,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Interested in working together?\nFeel free to contact me for any project or collaboration.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallOrNormalScreen ? 16.0 : 18.0,
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: isSmallOrNormalScreen
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: _getImages(
                                isSmallOrNormalScreen: isSmallOrNormalScreen,
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: _getForms(
                                  bloc: bloc,
                                  isSmallOrNormalScreen: isSmallOrNormalScreen),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: _getImages(
                                isSmallOrNormalScreen: isSmallOrNormalScreen,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: _getForms(
                                bloc: bloc,
                                isSmallOrNormalScreen: isSmallOrNormalScreen,
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

  Widget _getImages({required bool isSmallOrNormalScreen}) {
    return Align(
      alignment:
          isSmallOrNormalScreen ? Alignment.center : Alignment.centerRight,
      child: Image.asset('assets/images/coworking.png'),
    );
  }

  Widget _getForms(
      {required PortofolioBloc bloc, required bool isSmallOrNormalScreen}) {
    String emailAddress = "";
    return Column(
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
          child: BlocListener<PortofolioBloc, PortofolioState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is PortofolioSuccessState) {
                emailAddress = state.portofolio.contacts
                    .singleWhere((contact) =>
                        contact.platform.toLowerCase() == 'Gmail'.toLowerCase())
                    .url;
              } else {
                emailAddress = "erikriosetiawan15@gmail.com";
              }
            },
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isNameEmpty = _isEmptyValidate(_nameController);
                  _isEmailEmpty = _isEmptyValidate(_emailController);
                  _isSubjectEmpty = _isEmptyValidate(_subjectController);
                  _isMessageEmpty = _isEmptyValidate(_messageController);
                });

                if (!_isNameEmpty &&
                    !_isEmailEmpty &&
                    !_isSubjectEmpty &&
                    !_isMessageEmpty) {
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String subject = _subjectController.text;
                  String message = _messageController.text;

                  final emailUri = Uri(
                    scheme: 'mailto',
                    path: emailAddress,
                    queryParameters: {
                      'name': name,
                      'email': email,
                      'subject': subject,
                      'message': message,
                    },
                  );

                  String url = emailUri.toString();
                  await canLaunch(url)
                      ? await launch(url)
                      : throw 'Could not launch $url';
                }
              },
              child: Text('Send'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  isSmallOrNormalScreen
                      ? EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 28.0,
                        )
                      : EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 34.0,
                        ),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: isSmallOrNormalScreen ? 16.0 : 18.0,
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
        ),
      ],
    );
  }

  bool _isEmptyValidate(TextEditingController controller) {
    return controller.text.isEmpty;
  }
}
