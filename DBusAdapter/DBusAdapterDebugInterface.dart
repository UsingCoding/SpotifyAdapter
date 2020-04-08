import './Model/DBusParams.dart';

class DBusAdapterDebugInterface
{
  Future<void> printProvidedCommand({String address, String interface, String method, List<DBusParams> params = const []}) async {}
}
