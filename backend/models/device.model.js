import mongoose from "mongoose";

const deviceSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    unique: true,
  },
  status: {
    type: String,
    required: true,
  }
});

const deviceModel = mongoose.model("Device", deviceSchema);

export default deviceModel;
