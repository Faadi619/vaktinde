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
  String? _errorCode;
  late final StreamSubscription<User?> _authStateSubscription;

  User? get firebaseUser => _firebaseUser;
  UserModel? get user => _user;
  bool get isAuthenticated => _firebaseUser != null;
  bool get isLoading => _isLoading;
  String? get errorCode => _errorCode;

  Future<void> signInWithGoogle() async {
    _setLoading(true);
    _setErrorCode(null);

    try {
      await _authService.signInWithGoogle();
    } catch (_) {
      _setErrorCode('sign_in_failed');
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

    if (firebaseUser == null) {
      _user = null;
      notifyListeners();
      return;
    }

    _setLoading(true);
    _setErrorCode(null);

    try {
      _user = await _userRepository.getOrCreateUser(firebaseUser);
    } catch (_) {
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
