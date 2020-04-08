import 'Model/DBusParams.dart';

class DBusAdapterInterface {
	Future<String> call({String address, String interface, String method, List<DBusParams> params = const []}) async{}
  Future<String> getProperty({String address, String interface, String method, String property}) async {}
}
