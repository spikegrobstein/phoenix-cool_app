alias CoolApp.Track

track_params = [%{
  sid: "sid",
  title: "Track 1",
  artist: "Artist 1",
  artist_sid: "artistsid",
  album: "Album 1",
  album_sid: "albumsid",
  album_art: [%{
    "url" => "http://foo.com",
    "height" => 500,
    "width" => 500
  },
  %{
    "url" => "http://bar.com",
    "height" => 64,
    "width" => 64
  }]
},
%{
  sid: "sid2",
  title: "Track 2",
  artist: "Artist 1",
  artist_sid: "artistsid",
  album: "Album 1",
  album_sid: "albumsid",
  album_art: [%{
    "url" => "http://foo.com",
    "height" => 500,
    "width" => 500
  },
  %{
    "url" => "http://bar.com",
    "height" => 64,
    "width" => 64
  }]
}]

track_params
|> Enum.with_index
|> Enum.each(fn({track, index}) ->
  Track.persist_track(track, index)
end)
