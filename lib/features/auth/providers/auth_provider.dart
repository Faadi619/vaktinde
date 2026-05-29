import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../data/auth_service.dart';
import '../data/user_repository.dart';
import '../domain/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  final UserRepository _userRepository;

  AuthProvider({AuthService? authService, UserRepository? userRepository})
    : _authService = authService ?? AuthService(),
      _userRepository = userRepository ?? UserRepository() {
    _authStateSubscription = _authService.authStateChanges().listen(
      _onAuthStateChanged,
    );
  }

  User? _firebaseUser;
  UserModel? _user;
  bool _isLoading = false;
  bool _isInitialized = false;
  String? _errorCode;
  late final StreamSubscription<User?> _authStateSubscription;

  User? get firebaseUser => _firebaseUser;
  UserModel? get user => _user;
  bool get isAuthenticated => _firebaseUser != null;
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  String? get errorCode => _errorCode;

  Future<void> signInWithGoogle() async {
    _setLoading(true);
    _setErrorCode(null);

    try {
      final credential = await _authService.signInWithGoogle();
      if (credential == null) {
        return;
      }
    } catch (_) {
      _setErrorCode('sign_in_failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    _setErrorCode(null);

    try {
      await _authService.signInWithEmailPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          _setErrorCode('invalid_email');
          break;
        case 'user-not-found':
        case 'wrong-password':
        case 'invalid-credential':
          _setErrorCode('invalid_credentials');
          break;
        default:
          _setErrorCode('sign_in_failed');
      }
    } catch (_) {
      _setErrorCode('sign_in_failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> registerWithEmailPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    _setLoading(true);
    _setErrorCode(null);

    try {
      final refreshedUser = await _authService.registerWithEmailPassword(
        email: email.trim(),
        password: password,
        displayName: displayName.trim(),
      );
      if (refreshedUser != null) {
        _user = await _userRepository.getOrCreateUser(refreshedUser);
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          _setErrorCode('email_already_in_use');
          break;
        case 'invalid-email':
          _setErrorCode('invalid_email');
          break;
        case 'weak-password':
          _setErrorCode('weak_password');
          break;
        default:
          _setErrorCode('sign_in_failed');
      }
    } catch (_) {
      _setErrorCode('sign_in_failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    _setLoading(true);
    _setErrorCode(null);

    try {
      await _authService.sendPasswordResetEmail(email.trim());
      return true;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        _setErrorCode('invalid_email');
      } else {
        _setErrorCode('sign_in_failed');
      }
      return false;
    } catch (_) {
      _setErrorCode('sign_in_failed');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    _setLoading(true);
    _setErrorCode(null);

    try {
      await _authService.signOut();
    } catch (_) {
      _setErrorCode('sign_out_failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    _firebaseUser = firebaseUser;
    _isInitialized = true;

    if (firebaseUser == null) {
      _user = null;
      notifyListeners();
      return;
    }

    _setLoading(true);
    _setErrorCode(null);

    try {
      _user = await _userRepository.getOrCreateUser(firebaseUser);
    } catch (error, stackTrace) {
      debugPrint('getOrCreateUser failed: $error\n$stackTrace');
      _setErrorCode('profile_load_failed');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorCode(String? value) {
    _errorCode = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _authStateSubscription.cancel();
    super.dispose();
  }
}
