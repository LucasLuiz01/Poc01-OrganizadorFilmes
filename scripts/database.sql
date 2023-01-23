CREATE TABLE "genre" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);
CREATE TABLE "movie" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"idGenre" integer NOT NULL REFERENCES "genre"("id")
);
CREATE TABLE "platform" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);
CREATE TABLE "userMovieStatus" (
	"id" serial NOT NULL PRIMARY KEY,
	"username" TEXT NOT NULL,
	"idMovie" integer NOT NULL REFERENCES "movie"("id"),
	"watched" BOOLEAN NOT NULL,
	"note" TEXT,
	"summary" TEXT
);
CREATE TABLE "moviePlatform" (
	"id" serial NOT NULL PRIMARY KEY,
	"idMovie" integer NOT NULL REFERENCES "movie"("id"),
	"idPlatform" integer NOT NULL REFERENCES "platform"("id")
);




