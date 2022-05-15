--Spotify data was downloaded from Kaggle.
--Data was then imported into Microsoft SQL Server from Excel file populated with Spotify.csv data and parsed into a table.
--Analytics were then made using SQL queries on Microsoft SQL Server Management Studio.

--Select data that is going to be used as reference query.
SELECT artist, title, top_genre, year AS release_year, beats_per_minute, energy, danceability, loudness_dB, liveness, valance, length, acousticness, speechiness, popularity
	FROM ADPP_DB..top2021
	ORDER BY 1,2;

--Avg popularity, danceability, and energy by artist and track.
SELECT artist, title, avg(popularity) AS avg_popularity, avg(danceability) AS avg_danceability, avg(energy) AS avg_energy
	FROM ADPP_DB..top2021
	GROUP BY artist, title;

--Determined which artists had the most songs on the Top 100 list.
SELECT artist, COUNT(artist) AS total_songs
	FROM ADPP_DB..top2021
	GROUP BY artist
	ORDER BY COUNT(artist) DESC;

--Determined the top 10 artists overall based on popularity.
SELECT TOP 10 artist, popularity
	FROM ADPP_DB..top2021;

--Determined the top 10 most popular songs.
SELECT TOP 10 artist, title, popularity
	FROM ADPP_DB..top2021;

--Determine which genres were the most popular.
SELECT top_genre, COUNT(top_genre) AS total_per_genre
	FROM ADPP_DB..top2021
	GROUP BY top_genre
	ORDER BY COUNT(top_genre) DESC;