import 'dart:io';

import './SpotifyAdapter/SpotifyAdapter.dart';
import './SpotifyAdapter/SpotifyAdapterInterface.dart';


class SpotifyControlCommand {
	static const PLAY_PAUSE = '--play-pause';
	static const NEXT = '--next';
	static const PREV = '--prev';

	final SpotifyAdapterInterface adapter;

	SpotifyControlCommand(List<String> args): adapter = SpotifyAdapter()
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
		  	default:
				adapter.playPause();
		}
	}
}

main(List<String> args) => SpotifyControlCommand(args);
