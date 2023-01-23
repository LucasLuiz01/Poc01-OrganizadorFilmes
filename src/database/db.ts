import pkg from "pg";

const {Pool} = pkg;

export const connection = new Pool({
    connectionString: "postgresql://poc:1234@localhost:5433/moviesdb?schema=public"
})

