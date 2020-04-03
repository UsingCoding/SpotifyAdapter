import './SpotifyAdapter/SpotifyAdapter.dart';
import './SpotifyAdapter/SpotifyAdapterInterface.dart';

main(List<String> args) {
	SpotifyAdapterInterface adapter = SpotifyAdapter();

	adapter.retrieveMetadata();
}
