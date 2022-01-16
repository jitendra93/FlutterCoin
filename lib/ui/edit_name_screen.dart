import 'package:flutter/material.dart';
import 'package:validus/storage/secure_storage.dart';

import '../StockTheme.dart';
import '../constants.dart';

class EditNameWidget extends StatefulWidget {
  const EditNameWidget({Key? key}) : super(key: key);

  @override
  _EditNameWidgetState createState() => _EditNameWidgetState();
}

class _EditNameWidgetState extends State<EditNameWidget> {
  _EditNameWidgetState();

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchName();
  }

  Future<void> _fetchName() async {
    final data = await SecureStorage.read(NAME);
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
          title: Text('Edit Name'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'We\'ll send you an email to confirm you name change',
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
                        Text(NAME),
                        TextFormField(
                          controller: myController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? input) =>
                          input != null && input.isValidName()
                              ? null
                              : "Check name! Only alphabets allowed.",
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

                    if (myController.text.isValidName()) {
                      updateName(context);
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

  Future<void> updateName(BuildContext context) async {
    await SecureStorage.write(NAME, myController.text.trim());
    Navigator.pop(context, true);
  }
}

extension NamelValidator on String {
  bool isValidName() {
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(this);
  }
}
