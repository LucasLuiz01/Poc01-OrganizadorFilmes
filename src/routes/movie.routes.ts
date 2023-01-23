import { Router } from "express";
import { insertMovie,inserUserMovieStatus } from "../controllers/movie.controllers.js";

export const movieRouter = Router();

movieRouter.post("/movie", insertMovie);
movieRouter.post("/userStatus", inserUserMovieStatus);