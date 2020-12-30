import 'package:myapp/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

mixin UserModel on Model {
  User authenticatedUser;
  void login(String email, String password) {
    authenticatedUser =
        User(id: 'randdfvahv', email: email, password: password);
  }

  // User get authenticatedUser {
  //   return _authenticatedUser != null ? _authenticatedUser : null;
  // }
}
