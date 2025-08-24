const functions = require("firebase-functions");
const axios = require("axios");

// Cloud Function to connect to OpenAI GPT API
exports.finGenieAI = functions.https.onRequest(async (req, res) => {
  try {
    const prompt = req.body.prompt;
    const apiKey = functions.config().openai.key;

    const response = await axios.post(
      "https://api.openai.com/v1/chat/completions",
      {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }]
      },
      {
        headers: {
          "Authorization": `Bearer ${apiKey}`,
          "Content-Type": "application/json"
        }
      }
    );

    res.json({ reply: response.data.choices[0].message.content });
  } catch (error) {
    res.status(500).send(error.toString());
  }
});
