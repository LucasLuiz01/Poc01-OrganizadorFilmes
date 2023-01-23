import { Response, Request } from "express";
import { platformSchema } from "../schemas/platform.schema.js";
import { insertPlat } from "../repositories/platform.repositories.js";

export async function insertPlatform(req:Request, res:Response){
    const platformName: string = req.body;
    const {error} = platformSchema.validate(platformName);
    if( error){
        return res.status(400).send({
            message: error.message
        })
    }
    if(!platformName){
        return res.sendStatus(400);
    }
    try{
        await insertPlat(platformName)
        res.status(200).send("INSIRIDO COM SUCESSO");
    }catch(err){
        console.log(err);
       return res.status(400).send(err)
    }

}
