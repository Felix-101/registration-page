import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Provider/user_provider.dart';
import '../register.dart';
import 'constants/icons.dart';
import 'constants/assets.dart';
import 'constants/colors.dart';

class PhoneScreen extends ConsumerStatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends ConsumerState<PhoneScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkPhoneNumber);
  }

  void _checkPhoneNumber() {
    String phoneNumber = _phoneController.text;

    bool isValidPhoneNumber =
        RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phoneNumber);

    if (isValidPhoneNumber) {
      ref.read(userProvider.notifier).submitPhoneNumber(phoneNumber);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterPage()),
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
        backgroundColor: ColorAssets.primary,
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AssetPaths.arrow),
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
                "Start by entering your phone number to register",
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
                    child: Icon(IconAssets.phone, color: ColorAssets.secondary),
                  ),
                  hintText: '080 XXX XXX XX',
                  hintStyle: const TextStyle(
                      color: ColorAssets.tertiary, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: ColorAssets.tertiary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: ColorAssets.tertiary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ColorAssets.secondary),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                style: const TextStyle(color: ColorAssets.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
