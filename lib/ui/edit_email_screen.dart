import 'package:flutter/material.dart';
import 'package:validus/StockTheme.dart';
import 'package:validus/constants.dart';
import 'package:validus/storage/secure_storage.dart';

class EditEmailWidget extends StatefulWidget {
  EditEmailWidget({Key? key}) : super(key: key);

  @override
  State<EditEmailWidget> createState() => _EditEmailWidgetState();
}

class _EditEmailWidgetState extends State<EditEmailWidget> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchEmail();
  }

  Future<void> _fetchEmail() async {
    final data = await SecureStorage.read(EMAIL);
    if (data != null) {
      myController.text = data;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Edit email'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'We\'ll send you an email to confirm you new email address',
                  style: StockTheme.darkTextTheme.bodyText2,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: textBackgroundGrey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Email address'),
                        TextFormField(
                          controller: myController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? input) =>
                              input != null && input.isValidEmail()
                                  ? null
                                  : "Check your email",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  onPressed: () {

                    if (myController.text.isValidEmail()) {
                      updateEmail(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: selectedYellow,
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: Text(SAVE))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateEmail(BuildContext context) async {
    await SecureStorage.write(EMAIL, myController.text.trim());
    Navigator.pop(context, true);
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
