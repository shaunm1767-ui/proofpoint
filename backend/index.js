const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('ProofPoint Backend is running!'));
app.get('/health', (req, res) => res.json({ status: 'ok' }));
app.get('/health-this', (req, res) => res.json({ status: 'ok', message: 'health-this route works!' }));

app.listen(PORT, () => console.log(Server running on port ));
