import 'dart:io';
import 'DBusAdapterInterface.dart';
import './DBusAdapterExcetion.dart';

class DBusAdapter implements DBusAdapterInterface {
	static const _DBUS_ARGUMENT = 'dbus-send';
	static const _PRINT_REPLY_ARGUMENT = '--print-reply';
	static const _DEST_ARGUMENT = '--dest=';

  static const _FREEDESCKTOP_GET_PROPERTY_INTERFACE = 'org.freedesktop.DBus.Properties.Get';
  static const _FREEDESCKTOP_SET_PROPERTY_INTERFACE = 'org.freedesktop.DBus.Properties.Set';

  static const _TYPE_STRING_PREFIX = 'string:';

	Future<String> call({String address, String interface, String method, List<String> params = const []}) async
	{
		final process = await Process.run(_DBUS_ARGUMENT, [_PRINT_REPLY_ARGUMENT, _DEST_ARGUMENT + address, interface, method]);

		if (process.exitCode != 0) {
      throw DBusAdapterException.errorExitCode();
    }

		return await process.stdout as String;
	}

  Future<String> getProperty({String address, String interface, String method, String property}) async
  {
    final process = await Process.run(_DBUS_ARGUMENT, [_PRINT_REPLY_ARGUMENT, _DEST_ARGUMENT + address, interface, _FREEDESCKTOP_GET_PROPERTY_INTERFACE, _TYPE_STRING_PREFIX + method, _TYPE_STRING_PREFIX + property]);

		if (process.exitCode != 0) {
      throw DBusAdapterException.errorExitCode();
    }

    return process.stdout;
  }
}
