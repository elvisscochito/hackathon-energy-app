import deviceModel from '../models/device.model.js';

export const postDevice = async (req, res) => {
  try {
    const device = await deviceModel.create(req.body);
    res.status(201).json(device);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

export const getDevices = async (req, res) => {
  try {
    const devices = await deviceModel.find();
    res.status(200).json(devices);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}
