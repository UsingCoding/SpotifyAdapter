import './SpotifyAdapterInterface.dart';
import '../DBusAdapter/DBusAdapterInterface.dart';
import '../DBusAdapter/DBusAdapter.dart';

class SpotifyAdapter implements SpotifyAdapterInterface {

	static const ADDRESS = 'org.mpris.MediaPlayer2.spotify';
	static const INTERFACE = '/org/mpris/MediaPlayer2';
	static const METHOD_PREFIX = 'org.mpris.MediaPlayer2.Player';

	static const PLAY_PAUSE_METHOD_POSTFIX = '.PlayPause';
	static const SET_NEXT_METHOD_POSTFIX = '.Next';
	static const SET_PREVIOUS_METHOD_POSTFIX = '.Previous';

	static const META_DATA_PROPERTY_POSTFIX = 'Metadata';

	final DBusAdapterInterface dbusAdapter;

	SpotifyAdapter(): dbusAdapter = DBusAdapter();

	Future<void> playPause() async
	{
		dbusAdapter.call(address: ADDRESS, interface: INTERFACE, method: METHOD_PREFIX + PLAY_PAUSE_METHOD_POSTFIX);
	}

	Future<void> setNext() async
	{
		dbusAdapter.call(address: ADDRESS, interface: INTERFACE, method: METHOD_PREFIX + SET_NEXT_METHOD_POSTFIX);
	}

	Future<void> setPrevious() async
	{
		dbusAdapter.call(address: ADDRESS, interface: INTERFACE, method: METHOD_PREFIX + SET_PREVIOUS_METHOD_POSTFIX);
	}

	Future<void> retrieveMetadata() async
	{
		dbusAdapter.getProperty(address: ADDRESS, interface: INTERFACE, method: METHOD_PREFIX, property: META_DATA_PROPERTY_POSTFIX);
	}
}
