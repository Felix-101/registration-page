import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String phone = '';
  String password = '';
  String referedby = '';
  String devicetype = 'Android'; // Change based on the platform
  String registervia = 'Android';
  String countryTid = 'NFYUS';

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final url = Uri.parse(
          'https://testenvr2104.cardify.co/api/user/auth/register.php');
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      final body = {
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
        'referedby': referedby,
        'devicetype': devicetype,
        'registervia': registervia,
        'country_tid': countryTid,
      };

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status']) {
          // Handle successful registration
          print('Registration successful: $data');
        } else {
          // Handle registration failure
          print('Registration failed: ${data['text']}');
        }
      } else {
        // Handle error
        print('Registration failed: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
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
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    "Finish creating your cardify account",
                    style: TextStyle(
                      color: Color.fromARGB(255, 100, 100, 100),
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "First and Last Name",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Textfield(
                    txt1: "First Name",
                    onSaved: (value) => firstname = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your first name' : null,
                    icon1: Icons.person,
                  ),
                  const SizedBox(height: 15),
                  Textfield(
                    txt1: "Last Name",
                    onSaved: (value) => lastname = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your last name' : null,
                    icon1: Icons.person_outline,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Username",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Textfield(
                    txt1: "Username",
                    onSaved: (value) => username = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your username' : null,
                    icon1: Icons.person_outline,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Email",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Textfield(
                    txt1: "Email",
                    onSaved: (value) => email = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                    icon1: Icons.mail_outline,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Referral (optional)",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Textfield(
                    txt1: "Referral's username",
                    onSaved: (value) => referedby = value!,
                    icon1: Icons.person_add_alt_1_outlined,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Password",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Textfield(
                    txt1: "Password",
                    onSaved: (value) => password = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your password' : null,
                    icon1: Icons.lock_outline,
                    icon2: Icons.remove_red_eye_outlined,
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
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'I agree to Cardify Africa\'s ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Terms of Service ',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  TextSpan(
                                    text: 'and ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _agreeToTerms ? _register : null,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _agreeToTerms ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an Account?', style: TextStyle()),
                      SizedBox(width: 5),
                      Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  final String? txt1;
  final IconData? icon1;
  final IconData? icon2;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const Textfield(
      {Key? key,
      this.txt1,
      this.icon1,
      this.icon2,
      this.onSaved,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: icon1 != null
              ? Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(icon1, size: 24, color: Colors.grey),
                )
              : null,
          hintText: txt1,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 53, 53, 53),
            fontSize: 15,
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: icon2 != null
              ? Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(icon2, size: 24, color: Colors.grey),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
