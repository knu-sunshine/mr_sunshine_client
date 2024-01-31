import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleOauth {
  static Future<OAuthCredential> getCredential() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId: dotenv.env["GOOGLE_CLIENT_ID"],
            serverClientId: dotenv.env["GOOGLE_CLIENT_ID"])
        .signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return credential;

    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
