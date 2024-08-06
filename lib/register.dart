import 'package:card_reg/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/body/userParams.dart';
import 'constants/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  bool _agreeToTerms = false;
  final _formKey = GlobalKey<FormState>();

  String firstname = '';
  String lastname = '';
  String username = '';
  String email = '';
  String phone = ''; // Not used in the provided code
  String password = '';
  String referedby = '';
  String devicetype = 'Android'; // Change based on the platform
  String registervia = 'Android';

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      User user = User(
        firstname: firstname,
        lastname: lastname,
        username: username,
        email: email,
        phone: phone,
        password: password,
        referredby: referedby,
        devicetype: devicetype,
        registervia: registervia,
      );

      final url = Uri.parse(
          'https://testenvr2104.cardify.co/api/user/auth/register.php');
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = user.toJson(); // Ensure your User model has a toJson method

      try {
        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['status']) {
            print('Registration successful: $data');
          } else {
            print('Registration failed: ${data['text']}');
          }
        } else {
          print('Server error: ${response.statusCode}');
        }
      } catch (e) {
        print('Network error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorAssets.white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: ColorAssets.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: ColorAssets.black,
                      fontFamily: "OpenSans",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    "Finish creating your cardify account",
                    style: TextStyle(
                      color: ColorAssets.tertiary,
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "First and Last Name",
                    style: TextStyle(
                      color: ColorAssets.black,
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "First Name",
                      prefixIcon: Icon(IconAssets.person),
                    ),
                    onChanged: (value) => firstname = value,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your first name' : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      prefixIcon: Icon(IconAssets.personOutline),
                    ),
                    onSaved: (value) => lastname = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your last name' : null,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Username",
                    style: TextStyle(
                      color: ColorAssets.black,
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(IconAssets.personOutline),
                    ),
                    onSaved: (value) => username = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your username' : null,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Email",
                    style: TextStyle(
                      color: ColorAssets.black,
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(IconAssets.mailOutline),
                    ),
                    onSaved: (value) => email = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Referral (optional)",
                    style: TextStyle(
                      color: ColorAssets.black,
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Referral's username",
                      prefixIcon: Icon(IconAssets.personAddAlt1Outlined),
                    ),
                    onSaved: (value) => referedby = value!,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Password",
                    style: TextStyle(
                      color: ColorAssets.black,
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                      suffixIcon: Icon(IconAssets.lockOutline),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 28, minHeight: 28),
                    ),
                    obscureText: true,
                    onSaved: (value) => password = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your password' : null,
                  ),
                  const SizedBox(height: 20),
                  Theme(
                    data: Theme.of(context).copyWith(
                      checkboxTheme: CheckboxThemeData(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              _agreeToTerms = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _agreeToTerms = !_agreeToTerms;
                              });
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'I agree to Cardify Africa\'s ',
                                    style: TextStyle(color: ColorAssets.black),
                                  ),
                                  TextSpan(
                                    text: 'Terms of Service ',
                                    style:
                                        TextStyle(color: ColorAssets.secondary),
                                  ),
                                  TextSpan(
                                    text: 'and Privacy Policy.',
                                    style: TextStyle(color: ColorAssets.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorAssets.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Adjust the radius as needed
                          ),
                        ),
                        onPressed: _register,
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: ColorAssets.black,
                            fontSize: 18,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
