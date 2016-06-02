---
title:  "Intégration continue avec CircleCI"
categories:
  - continuous-integration
tags:
  - circleci,webhook
---

Au sein de [talkSpirit](https://www.talkspirit.com/) nous pratiquons [l'intégration continue](https://fr.wikipedia.org/wiki/Int%C3%A9gration_continue). Nous utilisons l'outil [CircleCI](https://circleci.com/) afin de faciliter l'exécution des tests jusqu'au déploiement en production. Aussi il était normal de l'avoir parmi les premières applications intégrées de talkSpirit.

Pour ça rien de plus simple, allez dans la rubrique `Services` et sélectionnez `CircleCI`

![](/images/posts/circleci-configuration.png){: .align-center .image-center}

Après avoir créé [l'intégration CircleCI](/docs/create-incoming-webhook/) au niveau de votre organisation, copiez-collez l'url du webhook dans le fichier [`circle.yml`](https://circleci.com/docs/configuration/#notify)

```yaml
notify:
  webhooks:
    - url: https://webhook.talkspirit.com/v1/incoming/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Les notifications déclenchées sont :

 - lorsque un build échoue
 - lorsqu'un build réussi après un échec
 - lors du 1er build d'une nouvelle branche

Contrairement aux outils qui ne sont que des chatrooms, talkSpirit possède un wall avec des commentaires car nous pensons que l'information doit-être hierarchisée. L'intégration de CircleCI s'appuie sur cette caractéristique. Lorsqu'un build est corrigé, le webhook s'ajoute en tant que commentaire. Ci-dessous un exemple d'intégration


![](/images/posts/circleci.png){: .align-center}
