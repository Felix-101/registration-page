import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'register.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkPhoneNumber);
  }

  Future<void> submitPhoneNumber(String phoneNumber) async {
    final url =
        Uri.parse('https://testenvr2104.cardify.co/api/user/auth/register.php');
    final response = await http.post(url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {'phoneNumber': phoneNumber});

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      // Handle successful response here
    } else {
      throw Exception("Invalid phone number");
      // Handle failure here
    }
  }

  void _checkPhoneNumber() {
    String phoneNumber = _phoneController.text;

    bool isValidPhoneNumber =
        RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phoneNumber);

    if (isValidPhoneNumber) {
      // Uncomment and adjust as needed
      submitPhoneNumber(phoneNumber);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const RegisterPage()), // Replace with your actual nextPage widget
      );
    }
  }

  @override
  void dispose() {
    _phoneController.removeListener(_checkPhoneNumber);
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 25, 75),
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("Assets/images/arrow.svg"),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 16, 25, 75),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Your Digits First',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "OpenSans",
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Start by entering your phone number to re...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Phone Number",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.phone, color: Colors.blue),
                  ),
                  hintText: '080 XXX XXX XX',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              // Add more widgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}
