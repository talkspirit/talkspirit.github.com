---
title:  "Intégration Bitbucket et talkspirit"
tags:
  - bitbucket,webhook
---

[Bitbucket][bitbucket] est un service permettant d'héberger des dépôts Git et 
Mercurial. 

[talkspirit][talkspirit] vous permet d'intégrer [Bitbucket][bitbucket] pour :

* suivre les activités de vos issues dans votre groupe (création d'un post par 
  issue et suivi du changement de statut en commentaires) ;
* suivre vos pull request dans votre groupe (suivi de son évolution en 
  commentaires : approuvée, refusée, fusionnée, etc.).

Pour ça rien de plus simple, allez dans la rubrique `Services` et sélectionnez 
`Bitbucket`

![](/images/posts/bitbucket-configuration.png){: .align-center .image-center}

Copiez l'URL affichée sur la page de confirmation de création du service. Il ne 
reste plus qu'à créer le webhook sur Bitbucket, pour cela rendez-vous dans les 
**Settings** de votre dépôt et dans le menu **Webhooks** :

![](/images/posts/bitbucket-webhook-1.png)

Cliquez sur le bouton **Add webhook** et collez l'URL dans le champ de texte.
Vous pouvez personnaliser les déclencheurs et donc les informations que vous 
souhaitez envoyer dans votre groupe talkspirit (issues, pull requests ou push) :

![](/images/posts/bitbucket-webhook-2.png)

Ci-dessous un exemple d'intégration :

![](/images/posts/bitbucket-post.png){: .align-center}

[bitbucket]: https://bitbucket.org/
[talkspirit]: https://www.talkspirit.com/
