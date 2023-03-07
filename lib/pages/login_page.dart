import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          // fit: StackFit.passthrough,
          children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/123.jpg')),
            )),
            Positioned(
              child: Center(
                child: Container(
                  width: 600,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'login',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: query.size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                            controller: emailcontroller,
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.endsWith('.com')) {
                                return 'please enter correct email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: query.size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'password'),
                            controller: passwordcontroller,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 6) {
                                return 'please enter correct password';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(190, 50)),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            }
                          });
                        },
                        child: const Text('Submit'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )

            // Add TextFormFields and ElevatedButton here.
          ],
        ),
      ),
    );
  }
}
