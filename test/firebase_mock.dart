import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class FirebaseAppMock extends Mock implements FirebaseApp {}
class FirebaseAuthMock extends Mock implements FirebaseAuth {}

void setupFirebaseAuthMocks() {
  // Mock the FirebaseApp
  FirebaseApp firebaseApp = FirebaseAppMock();

  // Mock the FirebaseAuth instance
  FirebaseAuth firebaseAuth = FirebaseAuthMock();

  // When the FirebaseAuth.instance getter is called, return the mock FirebaseAuth
  when(FirebaseAuth.instance).thenReturn(firebaseAuth);
}