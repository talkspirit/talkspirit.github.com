---
title: "Incoming Webhooks"
permalink: /docs/incoming-wehooks/
excerpt: "Incoming Webhooks is a way to send posts from external sources into talkSpirit."
modified: 2016-05-20T11:30:00-00:00
---

{% include base_path %}

Incoming Webhooks is a way to send posts from external sources into talkSpirit. 
The webhooks can be send to groups or users. Basically you just have to send a 
simple HTTP requests with a JSON payload.

Start by [setting up an incoming webhook integration][integration] in your 
talkSpirit team, grab the token and start to send posts.

## Sending posts

You'll learn how to post a message like this:

<figure>
  <img src="/images/docs/post-through-incoming-webhook3.png" alt="">
</figure>

For this message your JSON payload needs to define these properties:

    {
      "title": "First post through Incoming Webhook",
      "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "url": "https://www.talkspirit.com/",
      "contact": {
        "display_name": "Incoming Webhook bot",
        "url": "https://www.talkspirit.com/",
        "icon": "https://talkspirit.github.io/images/talkspirit-bot-avatar.png"
      }
    }

The illustration bellow shows you where the payload properties are placed in the post:

<figure>
  <img src="/images/docs/post-webhook.png" alt="">
  <figcaption>
    <ul>
      <li>blue: contact properties</li>
      <li>green: message properties</li>
    </ul>
  </figcaption>
</figure>

### CURL example

Incoming Webhooks are in JSON format so you need to set the `Content-type` HTTP 
header to `application/json`.

You can easily test the Incoming Webhooks through the command line bellow. You 
just need to copy/paste it and change the token (XXX...) by yours.

    curl -X POST -H 'Content-type: application/json' --data \
    '{
      "title": "First post through Incoming Webhook",
      "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "url": "https://www.talkspirit.com/",
      "contact": {
        "display_name": "Incoming Webhook bot",
        "url": "https://www.talkspirit.com/",
        "icon": "https://talkspirit.github.io/images/talkspirit-bot-avatar.png"
      }
    }' https://webhook.talkspirit.com/v1/incoming/XXXXXXXXXXXXXXXXXXXXXXXX

[integration]: https://talkspiritv3.zendesk.com/hc/en-us/articles/203586142-Integrating-web-services
