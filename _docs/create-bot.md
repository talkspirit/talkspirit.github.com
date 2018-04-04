---
title:  "Create your own bot"
permalink: /docs/create-bot/
---

## What are bots ?

A bot is pretty much like a new user in the chat on your platform. It has a name, a profile picture and you can discuss with it.
The big difference is that this one is not human, It is a program created to perform some predefined actions you ask it to. Thereby you could ask it to give you some of your entreprise statistics or to send a research on your internal search engine...

## How does it work ?

![bot schema](/img/docs/bot-schema.png)

Talkspirit bots use the HTTPS protocol. Every time a user write a message to a bot, a HTTPS request is sent to the bot’s configured url.
After that, it returns its response to the API with a standardised format.

## How can I create a new bot ?

Your bot can be created in the language of your choice, the only constraint is that it has to be able to communicate with HTTP requests.
A functional example developed with [Symfony](https://symfony.com/) is available here [bot-demo](https://github.com/talkspirit/bot-demo). Feel free to use it as a base code for your own bot.
In our example, we’ll suppose you’ve pressed the heroku deployment button visible on the repository’s README and now you have a live working BotDemo with an heroku url like https://polar-ridge-99999.herokuapp.com/

### Configure a new bot

To add your new bot, click on the settings icon and select Bots :

![panel bot](/img/docs/panel-bot.png)

Here you can view the bots proposed by talkspirit and create a new one by click on the “Add” button of the last entry.

![create bot button](/img/docs/create-bot-button.png)

Then you can give your bot a callback url and add some informations about it

![bot configuration panel](/img/docs/bot-configuration-panel.png)

Now enable your bot by pressing the button “users and rooms” on the top right corner and select the bot in the bots section.

### Receiving a request

All bot requests are sent to the url you configured for your bot. It’s up to you to analyse the user’s message to create your response. You can find all the informations you need to send in the [Technical specifications](#technical-specifications)

### Respond to a request

When the bot receives a request, this one contains a domain name (meta.host) and a token (meta.token) allowing you to construct the url. So the response will have to be sent to the url ‘https://webhook.talkspirit.com/v1/bot/{token}’ with the POST method.
There are different type of requests:
* bot_command: this message is sent to the bot when the user submits a command in the input field (/create for instance) or when the conversation is opened (so that the application can get the list of the available commands)
```json
{
   "meta":{
      "type":"bot_command",
      "host":"mon-organisation.talkspirit.com",
      "id":"566949ad620552955e8b4567",
      "token":"pbJIottQ1desXSizwB54p_iXYUT-xxx",
      "app_name":"custom_bot_command"
   },
   "data":{
      "id":"yFYZyX9P2tdsgunRwLL3_ybDSkNCNEMc7snUK94iF3o",
      "from":{
         "id":"jean-carriere",
         "displayname":"Jean Carri\u00e8re",
         "type":"user"
      },
      "room":{
         "id":"jeanBot_jean-carriere",
         "type":"private"
      },
      "command":"",
      "text":"",
      "ts":1520504760000
   }
}
```

* room_created: this message is sent to the bot when the user opens the conversation with the bot for the first time. The bot can answer this message with a welcoming message for instance.
```json
{
   "meta":{
      "type":"room_created",
      "host":"mon-organisation.talkspirit.com",
      "id":"566949ad620552955e8b4567",
      "token":"pbJIottQ1desXSizwB54p_iXYUT-xxx",
      "app_name":"custom_bot_command"
   },
   "data":{
      "from":{
         "id":"jean-carriere",
         "displayname":"Jean Carri\u00e8re",
         "type":"user"
      },
      "room":{
         "id":"jeanBot_jean-carriere",
         "type":"private"
      }
   }
}
```

* chat_message: this message is sent to the bot when the user sends a message.
```json
{
   "meta":{
      "host":"mon-organisation.talkspirit.com",
      "id":"566949ad620552955e8b4567",
      "token":"pbJIottQ1desXSizwB54p_iXYUT-xxx",
      "type":"chat_message",
      "app_name":"custom_bot_command"
   },
   "data":{
      "from":{
         "id":"jean-carriere",
         "displayname":"Jean Carri\u00e8re",
         "type":"user"
      },
      "room":{
         "id":"jeanBot_jean-carriere"
      },
      "text":"hello",
      "id":"5aa11001e893331613388552",
      "ts":1520504833463
   }
}
```

### Inline Query

When the user press the key “/” in the input field, the bot will receive a request: the result will list available bot’s commands which will be suggested to the user.

![bot commands autocompletion](/img/docs/bot-autocompletion.png)

Commands are predefined messages pattern which perform specific actions. It’s a good way to show what the bot can do and help new users to discover these functionalities.
Technically, when the API sends a message with an empty text with the type "bot_command", the bot has to send back the list of available commands. See the [inline queries specifications](#inline-queries) repository for more details.

## Technical specifications

### Received payloads

Here is a comprehensive list of all informations you will receive when a user will interact with your bot :

| Key | Description |
| ---- | ---------------- |
| meta | Informations about the application context |
| meta.type | Type of interaction (bot_command, chat_message, room_created)|
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

### Payloads to send

#### Chat message
Here is the list of informations you need to send to create a chat response.
Chat messages will be added to the conversation. They can contain a text, html content ifthe specified mode is html.

```json
{
	"meta" : {
		"type" : "chat_message"
	},
	"data" : {
		"text" : "Bot response",
    "mode" : "html",
    "buttons":[
            {
               "type":"postback",
               "payload":"payload to get back",
               "label":"Btn label",
               "icon":null,
               "color":"#6A7B68"
            }
    ],
		"room" : {
			"id" : "roomId"
		}
	}
}
```

#### Inline queries

Inline queries response will be displayed to the user as autosuggest in the input field.
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
