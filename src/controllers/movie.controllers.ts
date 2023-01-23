import { movieDados, moviePlatform, userMovieStatus } from "../protocols/movie.protocols.js";
import { Request, Response } from "express";
import { movieSchema } from "../schemas/movie.schema.js";
import { insertMov, insertuserMovieStats } from "../repositories/movie.repositories.js";
import { userMovieStatusSchema } from "../schemas/userMovieStatus.schema.js";

export async function insertMovie(req:Request, res:Response){
    const dados =  req.body as moviePlatform
    const {error} = movieSchema.validate(dados);
if( error){
    return res.status(400).send({
        message: error.message
    })
}
try {
    await insertMov(dados)
    res.status(200).send("INSIRIDO COM SUCESSO");
}catch(err){
    console.log(err);
    return res.status(400).send(err.detail);
}
}

export async function inserUserMovieStatus (req:Request, res: Response){
    const userDados = req.body as userMovieStatus;
    const {error} = userMovieStatusSchema.validate(userDados);
    if( error){
        return res.status(400).send({
            message: error.message
        })
    }
    try {
       const inserido = await insertuserMovieStats(userDados)
       console.log("INSERIDO", inserido)
        res.status(200).send("INSIRIDO COM SUCESSO");
    }catch(err){
        console.log(err);
        return res.status(400).send(err);
    }
}