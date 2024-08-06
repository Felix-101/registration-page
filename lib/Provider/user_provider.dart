import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/body/userParams.dart';
import '../data/user_api.dart';

final userProvider = StateNotifierProvider<UserProviderNotifier, User>((ref) {
  return UserProviderNotifier();
});

class UserProviderNotifier extends StateNotifier<User> {
  UserProviderNotifier() : super(User(phone: ''));

  Future<void> submitPhoneNumber(String phoneNumber) async {
    try {
      final user = await UserApi().submitPhoneNumber(phoneNumber);
      state = user;
    } catch (e) {
      // Handle error
    }
  }
}
