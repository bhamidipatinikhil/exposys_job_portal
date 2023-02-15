import 'package:exposys_registration/screens/exploration_screen.dart';
import 'package:exposys_registration/screens/second_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var userCredentialProvider = FutureProvider<UserCredential?>((ref) async {
  return null;
});

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key, required this.parentContext});
  BuildContext parentContext;
  Future<UserCredential> signInWithGoogle(WidgetRef ref) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        FirebaseAuth.instance.signInWithCredential(credential);

    userCredentialProvider = FutureProvider<UserCredential>((ref) async {
      return userCredential;
    });
    return await userCredential;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Exposys Data Labs", style: TextStyle(fontSize: 40)),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: ElevatedButton(
                    // style: ,
                    onPressed: () async {
                      final userCredential = await signInWithGoogle(ref);
                      final user = FirebaseAuth.instance.currentUser;
                      // Navigator.pushNamed(parentContext, 'explorationscreen');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen(user: user!)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign In With Google",
                            style: TextStyle(color: Colors.black)),
                        SizedBox(width: 10),
                        Image.network(
                          'https://1000logos.net/wp-content/uploads/2016/11/New-Google-Logo.jpg',
                          height: 20,
                        )
                      ],
                    ))),
          )),
        ],
      ),
    );
  }
}
