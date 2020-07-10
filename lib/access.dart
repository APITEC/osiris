import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// Models
import 'user.dart';

// Routes
import 'home.dart';

class Access extends StatefulWidget {
  @override
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {
  TextEditingController email = TextEditingController();
  TextEditingController token = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController governemntID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.grey[900],
            indicatorColor: Colors.redAccent,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(
                text: 'Login',
              ),
              Tab(
                text: 'Register',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: email,
                    cursorColor: Colors.grey[500],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: null,
                  ),
                  TextField(
                    controller: token,
                    cursorColor: Colors.grey[900],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Token',
                      hintStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: email,
                    cursorColor: Colors.grey[500],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: null,
                  ),
                  TextField(
                    controller: firstName,
                    cursorColor: Colors.grey[900],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  TextField(
                    controller: lastName,
                    cursorColor: Colors.grey[900],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  TextField(
                    controller: governemntID,
                    cursorColor: Colors.grey[900],
                    cursorWidth: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Government ID',
                      hintStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: IconButton(
                          icon: Icon(Icons.add_a_photo), onPressed: () {}),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () async {
                          var stamp = '1bc2783cn482b64n71cb6347n1cb';
                          var response = await http.post(
                            'https://osiris-api-v1.herokuapp.com/api/users/',
                            body: {
                              'email': email.text,
                              'first_name': firstName.text,
                              'last_name': lastName.text,
                              'government_id': governemntID.text,
                              'stamp': stamp,
                            },
                          );
                          Provider.of<UserData>(context, listen: false)
                              .setUser(json.decode(response.body));

                          if (response.statusCode == 201) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Pieces()));
                          }
                        },
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text(
                          'Create User',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
