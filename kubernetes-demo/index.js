const express = require("express")
const app = express()

const PORT = process.env.PORT || 5000


app.get("/", (req, res) => {
	res.json({
		message: "Hello from container",
		service: "Hello-Node",
		pod: process.env.POD || 'unknown',
		time: new Date().toISOString()
	})
});


app.get('/readyz', (req, res) => res.status(200).send('ready'))
app.get('/healthyz', (req, res) => res.status(200).send('ok'))

app.listen(PORT, () => {
	console.log(`Listening on port ${PORT}`)
})

