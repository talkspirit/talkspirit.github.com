---
title:  "Create your own bot"
permalink: /docs/create-bot/
---

## What are bots ?

A bot is pretty like a new user on your platform. He has a name, a profile picture and you can discuss with him.
The big difference is that this one is not human, its a program created to perform some predefined actions by chatting with. Thereby you could ask him to give you some of your entreprise statistics or to send a research on your internal search engine...

## How work a bot ?

![bot schema](/img/docs/bot-schema.png)

Talkspirit bots use the HTTPS protocol. Every time a user write him a message, a HTTPs request is sent to the bot’s configured url.
After that, it return his response to the API with a standardised format.

## How can I create a new bot ?

Your bot can be created in the language of your choice, the only constraint is that he has to be able to communicate with HTTP requests.
A functional example developed with symfony is available here https://github.com/talkspirit/bot-demo . Feel free to use it as a base code for your bot.
In our example, we’ll suppose you’ve pressed the heroku deployment button visible on the repository’s README and now you have a live working BotDemo with an heroku url like https://polar-ridge-99999.herokuapp.com/

### Configure a new bot

To add your new bot click on the settings icon and select Bots : 

![panel bot](/img/docs/panel-bot.png)

Here you can view the bots proposed by talkspirit and create a new one by click on the “Add” button of the last entry.

![create bot button](/img/docs/create-bot-button.png)

Then you can give your bots url and add some informations about it

![bot configuration panel](/img/docs/bot-configuration-panel.png)

Now enable your bot by pressing the button “users and rooms” on the top right corner and select the bot in the bots section.

### Receiving a request

All bot requests are sent to the url you configured for your bot. It’s up to you to analyse the user’s message to create your response. You can find all the informations you need to send in the [Technical specifications](“#technical-specifications”)

### Respond to a request

When the bot receive a request, this one contains a domain name (meta.host) and a token (meta.token) allowing you to construct the url. So the response will have to be sent to the url ‘{host}/v1/bot/{token}’ with the POST method.

### Inline Query

When the user press the key “/” he starts an inline query, the list available bot’s commands will be suggested for autocomplete.

![bot commands autocompletion](/img/docs/bot-autocompletion.png)

Commands are predefined messages pattern which perform specific actions. It’s a good way to show what the bot can do and help new users to discover these functionalities.
Technically when the API send you a message with an empty text, it means that it needs you to send the list of available commands. See the [inline queries specifications](“#inline-queries”) repository for more details.

## Technical specifications

### Received payload

Here is a comprehensive list of all informations you will receive when a user will interact with your bot :

| Key | Description |
| ---- | ---------------- |
| meta | Informations about the application context |
| meta.type | Type of interaction |
| meta.host | Domain name of the server sending the request |
| meta.token | Token to authenticate your response |
| data | Informations about the message |
| data.text | Content of the message sended by the user|
| data.room | Informations about the chat room |
| data.room.id | Id of the chat room |
| data.from | Informations about the message’s author |
| data.from.id | User slug |
| data.from.displayname | User name |
| data.from.type | User type (admin or user) |
| data.id | Message id |
| data.ts | Message timestamp|

### Sended payload

#### Chat message
Here is the list of informations you need to send to create a chat response.

```json
{
	"meta" : {
		"type" : "chat_message"
	},
	"data" : {
		"text" : "Bot response",
		"room" : {
			"id" : "roomId"
		}
	}
}
```

#### Inline queries
Here is the list of informations you need to send to create an inline query response.
```json
{
	"meta" : {
		"type" : "inline_query"
	},
	"data" : {
		"id" : "Message id",
		"result" : {
            "type" : "command",
            "title": "joke",
            "description": "tell a joke",
            "trigger": "/joke",
            "usage": "/joke"
		}
	}
}
```

