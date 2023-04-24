import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:social_app/core/core.dart';

final authApiProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthApi(account: account);
});

abstract class DomainAuth {
  FutureEither<User> signUp({
    required String email,
    required String password,
  });
}

class AuthApi implements DomainAuth {
  final Account _account;

  /// [AuthApi] requires an instance of [Account] to be passed in
  AuthApi({required Account account}) : _account = account;

  @override
  FutureEither<User> signUp(
      {required String email, required String password}) async {
    try {
      final User user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: email,
      );
      return right(user);
    } on AppwriteException catch (e) {
      return left(
        Failure(e.message ?? 'Something went wrong', StackTrace.current),
      );
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
