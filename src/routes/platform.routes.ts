import { Router } from "express";
import { insertPlatform } from "../controllers/platform.controller.js";

export const platformRouter = Router();

platformRouter.post("/platform", insertPlatform)