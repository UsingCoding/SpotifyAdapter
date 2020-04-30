import '../DBusAdapter/Model/DBusParams.dart';
import './CinnamonAdapterInterface.dart';
import '../DBusAdapter/DBusAdapterInterface.dart';
import '../DBusAdapter/DBusAdapter.dart';

class CinnamonAdapter implements CinnamonAdapterInterface
{
  static const ADDRESS = 'org.cinnamon';
  static const SCREEN_SAVER_ADDRESS_POSTFIX = '.ScreenSaver';

	static const INTERFACE = '/org/cinnamon/ScreenSaver';
	static const METHOD_PREFIX = 'org.cinnamon.ScreenSaver';

  static const LOCK_METHOD_POSTFIX = '.Lock';

  final DBusAdapterInterface dbusAdapter;

  CinnamonAdapter(): dbusAdapter = DBusAdapter();

  Future<void> lockScreen() async
  {
    dbusAdapter.call(
      address: ADDRESS + SCREEN_SAVER_ADDRESS_POSTFIX,
      interface: INTERFACE,
      method: METHOD_PREFIX + LOCK_METHOD_POSTFIX,
      params: [
        DBusParams(DBusParams.STRING_TYPE, 'msg')
      ]);
  }
}
