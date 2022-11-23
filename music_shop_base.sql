CREATE TABLE IF NOT EXISTS Music_genre (
    id SERIAL PRIMARY KEY,
    genre TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Bands (
	id SERIAL PRIMARY KEY,
    band TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS Band_and_genre_ref (
    id_genre INT NOT NULL REFERENCES Music_genre (id),
    id_band INT NOT NULL REFERENCES Bands (id),
    CONSTRAINT pk PRIMARY KEY (id_genre , id_band)
);
CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    release_year DATE);
CREATE TABLE IF NOT EXISTS Bands_and_albums (
	id_album INT NOT NULL REFERENCES Albums(id),
	id_band INT NOT NULL REFERENCES Bands(id),
    CONSTRAINT pk PRIMARY KEY (id_album, id_band));
CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
    id_album INT NOT NULL REFERENCES Albums(id),
    song_title TEXT NOT NULL,
    song_lasting TIME
    );
CREATE TABLE IF NOT EXISTS Collections(
	id SERIAL PRIMARY KEY,
    title TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS Tracks_in_collections (
	id_collection INT NOT NULL REFERENCES Collections(id),
	id_track INT NOT NULL REFERENCES Tracks(id),
    CONSTRAINT pk PRIMARY KEY (id_collection, id_track))