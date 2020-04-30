class SpotifyAdapterInterface {
	Future<void> playPause() async {}
  Future<void> pause() async {}
	Future<void> retrieveMetadata() async {}
  Future<void> setNext() async {}
  Future<void> setPrevious() {}
  Future<String> getCurrentSong() async {}
  Future<void> stopPlayingAfterSongChanged() async {}
}
