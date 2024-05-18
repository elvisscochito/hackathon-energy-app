import mongoose from "mongoose";

const deviceSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    unique: true,
  },
  status: {
    type: Boolean,
    required: true,
  },
  ip: {
    type: String,
    required: true,
  },
  consumption: {
    type: Number,
    required: true,
  }
});

const deviceModel = mongoose.model("Device", deviceSchema);

export default deviceModel;
