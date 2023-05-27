import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  String? _verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // sign in anonymously
  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      print("There was an exception in auth ");
      print(e);
      return null;
    }
  }

  // sign in with email and pass

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("There was an exception in email and password sign in: $e");
      return null;
    }
  }

  // register with email and pass

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("There was an exception in email and password registration: $e");
      return null;
    }
  }

  // Send the verification code
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // This callback will be called when the verification is done automatically
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification failed: $e");
        },
        codeSent: (String verificationId, int? resendToken) {
          // Save the verificationId for later use
          this._verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // This callback will be called when the auto-retrieval timeout is exceeded
          this._verificationId = verificationId;
        },
      );
    } catch (e) {
      print("Error verifying phone number: $e");
    }
  }

  // Sign in with the verification code
  Future<User?> signInWithPhoneNumber(String smsCode) async {
    try {
      // Create a PhoneAuthCredential with the provided SMS code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this._verificationId!, // Use _verificationId here
        smsCode: smsCode,
      );

      // Sign in the user
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("Error signing in with phone number: $e");
      return null;
    }
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    print("Trying to login with Google...");
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in process
        return null;
      }

      // Obtain the Google authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create the credentials for Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("There was an exception in Google Sign-In: $e");
      return null;
    }
  }
  // sign out

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
