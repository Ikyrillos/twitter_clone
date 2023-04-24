import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/apis/auth_api.dart';
import 'package:social_app/core/core.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authApi: ref.watch(authApiProvider));
});

class AuthController extends StateNotifier<bool> {
  final AuthApi _authApi;

  AuthController({required authApi})
      : _authApi = authApi,
        super(false);

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    var res = await _authApi.signUp(
      email: email,
      password: password,
    );

    res.fold(
      (l) {
        state = false;
        showSnackbar(context, l.message);
      },
      (r) {
        state = false;
        showSnackbar(context, 'Account created successfully');
      },
    );
  }
}
