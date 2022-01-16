import 'package:flutter/material.dart';
import 'package:validus/StockTheme.dart';
import 'package:validus/constants.dart';
import 'package:validus/storage/secure_storage.dart';
import 'package:validus/ui/edit_address_screen.dart';
import 'package:validus/ui/edit_name_screen.dart';
import 'edit_email_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, String> _userData = {};

  @override
  void initState() {
    super.initState();
    _readAll();
  }

  Future<void> _readAll() async {
    final data = await SecureStorage.readAll();

    setState(() {
      _userData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: primary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NAME,
                        style: StockTheme.darkTextTheme.bodyText2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return EditNameWidget();
                            },
                          )).then((value) => {
                                if (true == value) {_readAll()}
                              });
                        },
                        child: Text(
                          EDIT,
                          style: StockTheme.darkTextTheme.bodyText2
                              ?.copyWith(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  Text(
                    _userData[NAME] ?? '',
                    style: StockTheme.darkTextTheme.headline3,
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        EMAIL,
                        style: StockTheme.darkTextTheme.bodyText2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return EditEmailWidget();
                            },
                          )).then((value) => {
                                if (true == value) {_readAll()}
                              });
                        },
                        child: Text(
                          EDIT,
                          style: StockTheme.darkTextTheme.bodyText2
                              ?.copyWith(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  Text(
                    _userData[EMAIL] ?? '',
                    style: StockTheme.darkTextTheme.headline3,
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ADDRESS,
                        style: StockTheme.darkTextTheme.bodyText2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return EditAddressWidget();
                            },
                          )).then((value) => {
                                if (true == value) {_readAll()}
                              });
                        },
                        child: Text(
                          EDIT,
                          style: StockTheme.darkTextTheme.bodyText2
                              ?.copyWith(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  Text(
                    _userData[ADDRESS] ?? '',
                    style: StockTheme.darkTextTheme.headline3,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
