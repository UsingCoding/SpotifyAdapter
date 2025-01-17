import './SpotifyAdapterInterface.dart';
import '../DBusAdapter/DBusAdapterInterface.dart';
import '../DBusAdapter/DBusAdapter.dart';
import '../WmctrlAdapter/WmctrlAdapterInterface.dart';
import '../WmctrlAdapter/WmctrlAdapter.dart';

import 'dart:async';

class SpotifyAdapter implements SpotifyAdapterInterface {

  static final APPLICATION_CLASS = 'spotify.Spotify';
  static final SPOTIFY_FREE_TITLE = 'Spotify Free';

	static const ADDRESS = 'org.mpris.MediaPlayer2.spotify';
	static const INTERFACE = '/org/mpris/MediaPlayer2';
	static const METHOD_PREFIX = 'org.mpris.MediaPlayer2.Player';

	static const PLAY_PAUSE_METHOD_POSTFIX = '.PlayPause';
  static const PAUSE_METHOD_POSTFIX = '.Pause';
	static const SET_NEXT_METHOD_POSTFIX = '.Next';
	static const SET_PREVIOUS_METHOD_POSTFIX = '.Previous';

	static const META_DATA_PROPERTY_POSTFIX = 'Metadata';

	final DBusAdapterInterface dbusAdapter;
  final WmctrlAdapterInterface wmctlAdapter;

	SpotifyAdapter(): dbusAdapter = DBusAdapter(), wmctlAdapter = WmctrlAdapter();

	Future<void> playPause() async
	{
		dbusAdapter.call(address: ADDRESS, interface: INTERFACE, method: METHOD_PREFIX + PLAY_PAUSE_METHOD_POSTFIX);
	}

  Future<void> pause() async
	{
		dbusAdapter.call(address: ADDRESS, interface: INTERFACE, method: METHOD_PREFIX + PAUSE_METHOD_POSTFIX);
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

  Future<String> getCurrentSong() async
  {
    final songName = await wmctlAdapter.retrieveApplicationTitle(APPLICATION_CLASS);

    if (songName == SPOTIFY_FREE_TITLE) {
      return 'Paused';
    }

    if (songName == '') {
      return 'Spotify not launched';
    }

    return songName;
  }

  Future<void> stopPlayingAfterSongChanged() async
  {
    final songName = await getCurrentSong();

    if (songName == 'Paused' || songName == 'Spotify not launched') return;

    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) async {
      if (songName != await getCurrentSong())
      {
        pause();
        t.cancel();
      }
    });
  }
}
