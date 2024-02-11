const dummyData = require('../data/dummyData');

exports.getData = (req, res) => {
  // Return dummy data
  res.status(200).json(dummyData);
};
