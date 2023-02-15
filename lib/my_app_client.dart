import 'package:firebase_auth/firebase_auth.dart';

User? getCurrentUser() {
  final _user = FirebaseAuth.instance.currentUser;
  print(_user);
// print("User: ${_user.displayName ?? "None"}");
  return _user;
}
