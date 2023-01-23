export type movieDados = {
    id: number,
    name: string,
    idGenre: number,
    idPlataform: number,
    idMovie: number,
    username: string,
    whatched: boolean,
    note?: string,
    summary?: string
}

export type moviePlatform = Omit<movieDados, "id" | "whatched"| "note"| "summary"| "username"| "idMovie">
export type userMovieStatus = Omit<movieDados, "id" | "name" | "idGenre" | "idPlataform">