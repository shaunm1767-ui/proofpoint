const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.json());

// Dummy database for demo
const users = [];

// Registration route
app.post('/register', (req, res) => {
  const { name, email } = req.body;
  const token = Math.random().toString(36).substring(2, 15); // simple token
  users.push({ name, email, token });
  res.json({ status: 'registered', token });
});

// Verification route
app.get('/verify', (req, res) => {
  const token = req.query.token;
  const user = users.find(u => u.token === token);
  if (!user) return res.status(400).json({ error: 'invalid token' });
  res.json({ status: 'verified', user });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
