export type movieDados = {
    id: number,
    name: string,
    idGenre: number,
    idPlataform: number,
    idMovie: number,
    username: string,
    watched: boolean,
    note?: string,
    summary?: string
}

export type moviePlatform = Omit<movieDados, "id" | "watched"| "note"| "summary"| "username"| "idMovie">
export type userMovieStatus = Omit<movieDados, "id" | "name" | "idGenre" | "idPlataform">
export type updateMovieStatus = Omit<movieDados,  "name" | "idGenre" | "idPlataform"| "idMovie"| "username">