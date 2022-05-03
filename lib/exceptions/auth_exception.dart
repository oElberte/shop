class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail already registered.',
    'OPERATION_NOT_ALLOWED': 'Operation not allowed!',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Access temporarily blocked. Try again later!',
    'EMAIL_NOT_FOUND': 'E-mail not found.',
    'INVALID_PASSWORD': 'Invalid password.',
    'USER_DISABLED': 'This account has been disabled.',
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'There was an error in the authentication.';
  }
}
