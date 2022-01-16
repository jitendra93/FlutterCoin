import 'package:flutter/material.dart';
import 'package:validus/constants.dart';
import 'package:validus/storage/secure_storage.dart';

import '../StockTheme.dart';


class EditAddressWidget extends StatefulWidget {
  const EditAddressWidget({Key? key}) : super(key: key);

  @override
  _EditAddressWidgetState createState() => _EditAddressWidgetState();
}

class _EditAddressWidgetState extends State<EditAddressWidget> {
  _EditAddressWidgetState();

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchAddress();
  }

  Future<void> _fetchAddress() async {
    final data = await SecureStorage.read(ADDRESS);
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
          title: Text('Edit Address'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'We\'ll send you an email to confirm you address change',
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
                        Text(ADDRESS),
                        TextFormField(
                          controller: myController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? input) =>
                          input != null && input.isValidAddress()
                              ? null
                              : 'Check address.',
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

                    if (myController.text.isValidAddress()) {
                      updateAddress(context);
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

  Future<void> updateAddress(BuildContext context) async {
    await SecureStorage.write(ADDRESS, myController.text.trim());
    Navigator.pop(context, true);
  }
}

extension AddressValidator on String {
  bool isValidAddress() {
    return RegExp(r'^[a-zA-Z0-9 ,\/.-]+$').hasMatch(this);
  }
}
