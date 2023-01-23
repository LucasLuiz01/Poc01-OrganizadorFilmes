import { Response, Request } from "express";
import { insertGenre } from "../repositories/genre.repositories.js";
import { genreSchema } from "../schemas/genre.schema.js";

export async function insertGenres(req:Request, res:Response){
    const genreName: string = req.body;
    const {error} = genreSchema.validate(genreName);
    if( error){
        return res.status(400).send({
            message: error.message
        })
    }
    console.log(genreName);
    if(!genreName){
        return res.sendStatus(400);
    }
    try{
        await insertGenre(genreName)
        res.status(200).send("INSIRIDO COM SUCESSO");
    }catch(err){
        console.log(err);
       return res.status(400).send(err)
    }

}
