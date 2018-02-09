---
title: "Create an Incoming Webhook"
permalink: /docs/create-incoming-webhook/
excerpt: ""
modified: 2016-05-23
---

{% include base_path %}

[Incoming Webhooks][incoming-webhooks] is a way to send posts from external 
sources into talkspirit through a secret URL.

## Configure the Incoming Webhook

To create your Incoming Webhook to talkspirit click on the "Services" button on 
the top of the page then click on the "Add" button in front of Incoming Webhook
(you can filter services with the "webhook" term to easily find the section).

![](/images/docs/create-incoming-webhook.png){: .align-center}

* Select the group you want the Incoming Webhook posts being published into.
* Enter an optional title that describes your Incoming Webhook.
* Click on "Add" to finish.

You should get a secret URL where you can send posts. Go to the 
[Incoming Webhooks documentation][incoming-webhooks] to find how to send posts.

## Deleting an Incoming Webhook service

To delete an Incoming Webhook service, click on the "Manage" tab on the page 
associated with the Incoming Webhook service and click on the "Remove" button in 
front of the service you wish to remove.

Deleting an Incoming Webhook service doest not delete content already published.

[incoming-webhooks]: /docs/incoming-webhooks/
