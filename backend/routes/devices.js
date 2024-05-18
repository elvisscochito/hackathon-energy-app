import express from "express";
import * as deviceController from "../controllers/device.controller.js";

const router = express.Router();

router.post("/devices", deviceController.postDevice);
router.get("/devices", deviceController.getDevices);

export default router;
