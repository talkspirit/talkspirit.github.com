---
title: "Incoming Webhooks"
permalink: /docs/incoming-webhooks/
excerpt: "Incoming Webhooks is a way to send posts from external sources into talkSpirit."
modified: 2016-05-23
---

{% include base_path %}

Incoming Webhooks is a way to send posts from external sources into talkSpirit
through a secret URL. The webhooks can be send to groups or users. Basically you
just have to send a simple HTTP requests with a JSON payload in UTF-8.

Start by [setting up an incoming webhook integration][create-incoming-webhook]
in your talkSpirit team, grab the token and start to send posts.

## Sending posts

You'll learn how to post a message like this:

![](/images/docs/post-through-incoming-webhook3.png){: .align-center}

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

## Thread id field

talkSpirit supports threads, so you can send many webhooks on the same post. The following
webhooks are added as comments of the initial post.

To handle threaded messages you just have to define an identifier and set it in the payload in
the field `thread_id`. You can for example set the today's date or any unique identifier you want.

Example:

    curl -X POST -H 'Content-type: application/json' --data \
    '{
      "title": "First post through Incoming Webhook",
      "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "url": "https://www.talkspirit.com/",
      "thread_id": "2016-09-16",
      "contact": {
        "display_name": "Incoming Webhook bot",
        "url": "https://www.talkspirit.com/",
        "icon": "https://talkspirit.github.io/images/talkspirit-bot-avatar.png"
      }
    }' https://webhook.talkspirit.com/v1/incoming/XXXXXXXXXXXXXXXXXXXXXXXX

    curl -X POST -H 'Content-type: application/json' --data \
    '{
      "content": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "thread_id": "2016-09-16",
      "contact": {
        "display_name": "Incoming Webhook bot",
        "url": "https://www.talkspirit.com/",
        "icon": "https://talkspirit.github.io/images/talkspirit-bot-avatar.png"
      }
    }' https://webhook.talkspirit.com/v1/incoming/XXXXXXXXXXXXXXXXXXXXXXXX


The result:

![](/images/docs/post-through-incoming-webhook4.png){: .align-center}


[create-incoming-webhook]: /docs/create-incoming-webhook/
