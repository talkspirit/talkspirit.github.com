---
title: "Incoming Webhooks"
permalink: /docs/incoming-webhooks/
excerpt: "Incoming Webhooks allow you to send posts from external sources into talkspirit."
modified: 2025-02-28
---

# Incoming Webhooks

Incoming Webhooks enable you to send posts from external sources into talkspirit using a secret URL. You can send webhooks to groups or individual users by making a simple HTTP request with a JSON payload in UTF-8.

To get started, [set up an incoming webhook integration][create-incoming-webhook] in your talkspirit team, obtain the token, and start sending posts.

## Sending Posts

You can post messages using an incoming webhook. Here’s an example of a message sent via a webhook:

![](/img/docs/post-through-incoming-webhook3.png){: .align-center}

### JSON Payload Format

To create a post, your JSON payload should include the following properties:

```json
{
  "title": "First post through Incoming Webhook",
  "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "url": "https://www.talkspirit.com/",
  "contact": {
    "display_name": "Incoming Webhook bot",
    "url": "https://www.talkspirit.com/",
    "icon": "https://talkspirit.github.io/img/talkspirit-bot-avatar.png"
  }
}
```

The illustration below shows where these payload properties appear in the post:

<figure>
  <img src="/img/docs/post-webhook.png" alt="">
  <figcaption>
    <ul>
      <li><span style="color:blue">Blue</span>: Contact properties</li>
      <li><span style="color:green">Green</span>: Message properties</li>
    </ul>
  </figcaption>
</figure>

## Sending a Webhook Using cURL

Since incoming webhooks use JSON, set the `Content-Type` HTTP header to `application/json`.

You can test the webhook using the command below. Replace `XXXXXXXXXXXXXXXXXXXXXXXX` with your actual webhook token:

```sh
curl -X POST -H 'Content-Type: application/json' --data '
{
  "title": "First post through Incoming Webhook",
  "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "url": "https://www.talkspirit.com/",
  "contact": {
    "display_name": "Incoming Webhook bot",
    "url": "https://www.talkspirit.com/",
    "icon": "https://talkspirit.github.io/img/talkspirit-bot-avatar.png"
  }
}' https://webhook.talkspirit.com/v1/incoming/XXXXXXXXXXXXXXXXXXXXXXXX
```

### Debugging Your Webhooks

To test and debug your webhook requests before sending them to talkspirit, you can use tools like:

| Tool | Description |
|------|------------|
| [Beeceptor](https://beeceptor.com/) | Create a mock HTTP endpoint to inspect and debug webhook requests. |
| [Webhook.site](https://webhook.site/) | Monitor incoming HTTP requests and see detailed request logs. |

## Threaded Posts

talkspirit supports threads, allowing you to send multiple webhooks that appear as comments on an initial post. To achieve this, include a `thread_id` field in your payload. This can be any unique identifier, such as a timestamp or a custom string.

### Example: Sending a Threaded Message

#### Initial Post

```sh
curl -X POST -H 'Content-Type: application/json' --data '
{
  "title": "First post through Incoming Webhook",
  "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "url": "https://www.talkspirit.com/",
  "thread_id": "2025-02-28",
  "contact": {
    "display_name": "Incoming Webhook bot",
    "url": "https://www.talkspirit.com/",
    "icon": "https://talkspirit.github.io/img/talkspirit-bot-avatar.png"
  }
}' https://webhook.talkspirit.com/v1/incoming/XXXXXXXXXXXXXXXXXXXXXXXX
```

#### Reply to the Thread

```sh
curl -X POST -H 'Content-Type: application/json' --data '
{
  "content": "This is a reply to the initial post.",
  "thread_id": "2025-02-28",
  "contact": {
    "display_name": "Incoming Webhook bot",
    "url": "https://www.talkspirit.com/",
    "icon": "https://talkspirit.github.io/img/talkspirit-bot-avatar.png"
  }
}' https://webhook.talkspirit.com/v1/incoming/XXXXXXXXXXXXXXXXXXXXXXXX
```

### Expected Result

![](/img/docs/post-through-incoming-webhook4.png){: .align-center}

---

By following these steps, you can integrate external sources with talkspirit using incoming webhooks.

[create-incoming-webhook]: /docs/create-incoming-webhook/
