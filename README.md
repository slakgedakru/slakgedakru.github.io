# Trigedasleng Dictionary Site

This repo contains the source code for a website to display the Slakgedakru trigedasleng community dictionary. This site is designed to be deployed as a cloud-native static site to [slakgedakru.github.io](slakgedakru.github.io).

## Deploy

This dictionary has thousands of entries and takes a significant amount of workflow minutes to compile. As such, deployments are NOT automated with new pushes to `main`.

In order to deploy changes, you can navigate to the [deployment workflow page](https://github.com/slakgedakru/dictionary/actions/workflows/arise-deploy.yml) and manually trigger a deployment to update the live site from the latest commit to `main`.

## Acknowledgements

This site is built using [Arise](https://github.com/spectrasecure/arise). Site code is licensed under AGPLv3.
