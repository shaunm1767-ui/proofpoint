// index.js
const express = require('express');
const multer  = require('multer');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const app = express();
const PORT = process.env.PORT || 3000;

// ensure uploads folder exists
const UPLOAD_DIR = path.join(__dirname, 'uploads');
if (!fs.existsSync(UPLOAD_DIR)) fs.mkdirSync(UPLOAD_DIR, { recursive: true });

// simple in-memory store for demo (replace with DB later)
const users = {}; // token => { name, email, verified, files: [] }

app.use(express.json()); // parse JSON

// Default route
app.get('/', (req, res) => {
  res.send('ProofPoint Backend is running!');
});

// Health
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// Register (POST JSON: { name, email })
app.post('/register', (req, res) => {
  const { name, email } = req.body || {};
  if (!name || !email) return res.status(400).json({ error: 'name and email required' });

  const token = crypto.randomBytes(16).toString('hex');
  users[token] = {
    name,
    email,
    verified: false,
    registeredAt: new Date().toISOString(),
    files: []
  };

  // in real app send token by email (verification link)
  res.json({ status: 'ok', token });
});

// Verify (GET ?token=)
app.get('/verify', (req, res) => {
  const token = req.query.token || req.headers['x-token'];
  if (!token || !users[token]) return res.status(400).json({ error: 'invalid token' });

  users[token].verified = true;
  res.json({ status: 'ok', message: 'verified' });
});

// Set up multer storage for invoice uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, UPLOAD_DIR),
  filename: (req, file, cb) => {
    const prefix = Date.now();
    const safe = file.originalname.replace(/[^a-z0-9.\-_]/gi, '_');
    cb(null, `${prefix}_${safe}`);
  }
});
const upload = multer({ storage });

// Upload invoice (multipart/form-data with field "invoice" and token)
app.post('/uploadInvoice', upload.single('invoice'), (req, res) => {
  const token = req.body.token || req.query.token || req.headers['x-token'];
  if (!token || !users[token]) return res.status(401).json({ error: 'unauthorized - token missing/invalid' });
  if (!users[token].verified) return res.status(403).json({ error: 'account not verified' });

  if (!req.file) return res.status(400).json({ error: 'no file uploaded (use field name "invoice")' });

  users[token].files.push(req.file.filename);
  res.json({ status: 'ok', file: req.file.filename });
});

// DEBUG helper (remove in production) - shows registered users
app.get('/debug/users', (req, res) => res.json(users));

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
