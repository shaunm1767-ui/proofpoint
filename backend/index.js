const express = require('express');
const app = express();
const port = 3000;

app.use(express.json()); // <-- important for POST bodies

app.get('/', (req, res) => res.send('ProofPoint Backend is running!'));
app.get('/health', (req, res) => res.json({ status: 'ok' }));
app.get('/health-this', (req, res) => res.json({ status: 'ok', message: 'health-this route works!' }));

app.post('/demo', (req, res) => {
    console.log(req.body);        // logs incoming JSON
    res.json({ status: 'ok' });   // returns OK
});

app.listen(port, () => console.log(`Server running on port ${port}`));
