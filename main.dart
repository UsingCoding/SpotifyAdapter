import 'dart:io';

import './SpotifyAdapter/SpotifyAdapter.dart';
import './SpotifyAdapter/SpotifyAdapterInterface.dart';


class SpotifyControlCommand {
	static const PLAY_PAUSE = '--play-pause';
	static const NEXT = '--next';
	static const PREV = '--prev';
  static const GET_SONG = '--get-song';

	final SpotifyAdapterInterface adapter;

	SpotifyControlCommand(): adapter = SpotifyAdapter();

  Future<void> execute(List<String> args) async
  {
		if (args.length < 1) {
			exit(1);
		}

		switch (args[0]) {
		  	case PLAY_PAUSE:
				adapter.playPause();
				break;
			case NEXT:
				adapter.setNext();
				break;
			case PREV:
				adapter.setPrevious();
				break;
      case GET_SONG:
        stdout.write(await adapter.getCurrentSong());
        break;
		  default:
				adapter.playPause();
		}
  }
}

main(List<String> args) => SpotifyControlCommand().execute(args);
