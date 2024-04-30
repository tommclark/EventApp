import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class FirebaseAuthWrapper {
  final FirebaseAuth _auth;

  FirebaseAuthWrapper(this._auth);

  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password}) {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}

void main() {
  FirebaseAuthWrapper? authWrapper;
  MockFirebaseAuth? mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authWrapper = FirebaseAuthWrapper(mockFirebaseAuth!);
  });

  group('FirebaseAuthWrapper', () {
    test('createUserWithEmailAndPassword should throw FirebaseAuthException for admin@gmail.com', () async {
      when(mockFirebaseAuth!.createUserWithEmailAndPassword(email: 'admin@gmail.com', password: 'password'))
          .thenAnswer((_) => Future.error(FirebaseAuthException(code: 'email-already-in-use')));

      expect(
            () async => await authWrapper!.createUserWithEmailAndPassword(email: 'admin@gmail.com', password: 'password'),
        throwsA(isA<FirebaseAuthException>()),
      );
    });
  });
}