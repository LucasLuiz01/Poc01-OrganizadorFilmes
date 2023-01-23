import { connection } from "../database/db.js";
import { QueryResult } from "pg";
import {  moviePlatform, userMovieStatus, updateMovieStatus, platformProtocols, userMovieStatusGet, MovieGet } from "../protocols/movie.protocols.js";
export async function insertMov (dados:moviePlatform): Promise<string> {
    console.log(dados, "dadodadaodoadoadoaodaodoa")
    console.log(dados.idPlatform, "aquiaquiaqui")
    const platformExist: QueryResult<platformProtocols> = await connection.query('SELECT * FROM platform WHERE id = $1',[dados.idPlatform])
    if(platformExist.rows.length === 0){
        return "Id da plataforma não existente";
    }
    await connection.query('INSERT INTO movie (name, "idGenre") VALUES ($1, $2)', [dados.name, dados.idGenre]); 
    const movieId: QueryResult<MovieGet> = await connection.query('SELECT id FROM movie WHERE name = $1',[dados.name])
    await connection.query('INSERT INTO "moviePlatform" ("idMovie", "idPlatform") VALUES ($1, $2)', [movieId.rows[0].id, dados.idPlatform])
}

export async function insertuserMovieStats (userDados:userMovieStatus): Promise<string> {
    const userStatusExistente: QueryResult<userMovieStatusGet> = await connection.query('SELECT * from "userMovieStatus" WHERE username = $1 AND "idMovie" = $2',[userDados.username, userDados.idMovie])
    if(userStatusExistente.rows.length !== 0){
        return "FILME STATUS JÁ CADASTRADO PARA ESTE USÚARIO";
    }
    await connection.query('INSERT INTO "userMovieStatus" (username, "idMovie", watched, note, summary) VALUES ($1, $2, $3, $4, $5)', [userDados.username, userDados.idMovie, userDados.watched,userDados.note, userDados.summary]); 
}

export async function updateMovieStats (userDados:updateMovieStatus): Promise<string> {
    const userStatusExistente: QueryResult<userMovieStatusGet> = await connection.query('SELECT * from "userMovieStatus" WHERE id = $1',[userDados.id])
    if(userStatusExistente.rows.length === 0){
        return "User status não existente";
    }
    await connection.query('UPDATE "userMovieStatus" SET watched = $1, summary = $2, note =$3 WHERE id = $4', [userDados.watched, userDados.summary, userDados.note, userDados.id]); 
}
export async function deleteUserStatus(id:number):Promise<string> {
    const userStatusExistente: QueryResult<userMovieStatusGet> = await connection.query('SELECT * from "userMovieStatus" WHERE id = $1',[id])
    if(userStatusExistente.rows.length === 0){
        return "User status não existente";
    }
    await connection.query('DELETE FROM "userMovieStatus" WHERE id = $1', [id])
}