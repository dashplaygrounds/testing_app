const express = require('express')
const app = express()

app.use(express.static('./build/web'));

app.get('/*', (req,res) => {
    res.sendFile('index.html', {root: './build/web'});
});

const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`Server running on port ${port}`)
});