let users = [];

module.exports = {
  createUser: (email, password) => {
    const newUser = { email, password };
    users.push(newUser);
    return newUser;
  },
  findUserByEmail: (email) => {
    return users.find(user => user.email === email);
  }
};
