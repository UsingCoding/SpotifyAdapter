class DBusAdapterException implements Exception {

	final String _message;

	DBusAdapterException.errorExitCode(): _message = 'Failed response to d-bus';

	get message => _message;

  @override
  String toString() => _message;
}
