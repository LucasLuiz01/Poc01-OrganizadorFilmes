import { connection } from "../database/db.js";
import { QueryResult } from "pg";
import { movieDados, moviePlatform, userMovieStatus } from "../protocols/movie.protocols.js";

export async function insertMov (dados:moviePlatform): Promise<void> {
    await connection.query('INSERT INTO movie (name, "idGenre") VALUES ($1, $2)', [dados.name, dados.idGenre]); 
    const movieId: QueryResult = await connection.query('SELECT id FROM movie WHERE name = $1',[dados.name])
    await connection.query('INSERT INTO "moviePlatform" ("idMovie", "idPlatform") VALUES ($1, $2)', [movieId.rows[0].id, dados.idPlataform])
}

export async function insertuserMovieStats (userDados:userMovieStatus): Promise<string> {
    const userStatusExistente: QueryResult = await connection.query('SELECT * from "userMovieStatus" WHERE username = $1 AND "idMovie" = $2',[userDados.username, userDados.idMovie])
    if(userStatusExistente.rows.length !== 0){
        return "FILME STATUS JÁ CADASTRADO PARA ESTE USÚARIO";
    }
    await connection.query('INSERT INTO "user{Status" (username, "idMovie", watched, note, summary) VALUES ($1, $2, $3, $4, $5)', [userDados.username, userDados.idMovie, userDados.whatched,userDados.note, userDados.summary]); 
}

