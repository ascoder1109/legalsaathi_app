import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('users');

  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
    required String accountType,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String username = email.split('@').first;

      if (name.isNotEmpty) {
        await userCredential.user!.updateDisplayName(name);
        username = name;
      }

      await userCredential.user!.updateDisplayName(username);

      // Save user information to Firebase Realtime Database
      await _databaseReference.child(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'accountType': accountType,
      });

      return null; // Return null if sign-up successful
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message ?? 'An error occurred during sign-up.';
      }
    } catch (e) {
      return 'An unexpected error occurred. Please try again later.';
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Return null if login successful
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return 'Invalid email or password.';
      } else {
        return e.message ?? 'An error occurred during login.';
      }
    } catch (e) {
      return 'An unexpected error occurred. Please try again later.';
    }
  }

  Future<String?> getAccountType(String email) async {
    try {
      DataSnapshot snapshot = await _databaseReference
          .orderByChild('email')
          .equalTo(email)
          .once()
          .then((event) => event.snapshot);

      if (snapshot.value != null) {
        Map<String, dynamic> userData =
            Map<String, dynamic>.from(snapshot.value as Map);
        String accountType = userData.values.first['accountType'];
        return accountType;
      } else {
        return ''; // Return empty string if user not found or account type not set
      }
    } catch (error) {
      print('Error fetching account type: $error');
      return ''; // Return empty string in case of error
    }
  }
}
