class SpotifyAdapterInterface {
	Future<void> playPause() async {}
	Future<void> retrieveMetadata() async {}
  Future<void> setNext() async {}
  Future<void> setPrevious() {}
}
