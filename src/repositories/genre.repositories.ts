import { connection } from "../database/db.js";
import { QueryResult } from "pg";

export async function insertGenre (nome:string): Promise<void> {
    await connection.query('INSERT INTO genre (name) VALUES ($1)', [nome]);  
}