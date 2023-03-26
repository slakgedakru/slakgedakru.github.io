# Trigedasleng Dictionary Site

This repo contains the source code and deployment workflow for [slakgedakru.github.io](slakgedakru.github.io), a cloud-native static site version of the Trigedasleng community reference site.

The purpose of this site is to improve upon the now-defunct [trigedasleng.net](https://github.com/projectarkadiateam/trigedasleng) in two primary ways:

- This site relies on a GitHub repository ([slakgedakru/trigedasleng](https://github.com/slakgedakru/trigedasleng) instead of a database as a backend.
    - This allows anyone to download, fork, or contribute to the actual dataset for the Trigedasleng lexicon in a transparent and version controlled way.
- This site is fully cloud-native and is 100% free to operate with no hosting costs (and thus no risk of going down due to lack of funding).

## Data Sources

This site automatically pulls its lexicon data from [slakgedakru/trigedasleng](https://github.com/slakgedakru/trigedasleng) at deploy time.

## Deploy

This dictionary has thousands of entries and takes a significant amount of workflow minutes to compile. As such, deployments are NOT automated with new pushes to `main`.

In order to deploy changes, one must navigate to the [deployment workflow page](https://github.com/slakgedakru/dictionary/actions/workflows/arise-deploy.yml) and manually trigger a deployment to update the live site from the latest commit to `main`.

## Acknowledgements

This site is built using a slightly modified version of [Arise](https://github.com/spectrasecure/arise). Please reference the Arise documentation for more information as to how this site works. Site code is licensed under AGPLv3.
