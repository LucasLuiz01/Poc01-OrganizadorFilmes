import { connection } from "../database/db.js";
import { QueryResult } from "pg";

export async function insertPlat (platformName:string): Promise<void> {
    await connection.query('INSERT INTO platform (name) VALUES ($1)', [platformName]);  
}