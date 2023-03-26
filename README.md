# Trigedasleng / Slaksleng Reference Site

This repo contains the source code and deployment workflow for [slakgedakru.github.io](https://slakgedakru.github.io), a cloud-native static site version of the Trigedasleng community reference site.

The purpose of this site is to improve upon the now-defunct [trigedasleng.net](https://github.com/projectarkadiateam/trigedasleng) in two primary ways:

- This site relies on a GitHub repository ([slakgedakru/trigedasleng](https://github.com/slakgedakru/trigedasleng)) instead of a database as a backend.
    - This allows anyone to download, fork, or contribute to the actual dataset for the Trigedasleng lexicon in a transparent and version controlled way.
- This site is fully cloud-native and is 100% free to operate with no hosting costs (and thus no risk of going down due to lack of funding).

## Deploy

Changes are currently set to deploy on new pushes to `main` that modify `arise-out` (the deploy folder for the live site). Keep in mind that this dictionary has thousands of entries and takes a significant amount of workflow minutes to compile. Try keeping superfluous commits to a minimum.

Note that this site automatically pulls its lexicon data from [slakgedakru/trigedasleng](https://github.com/slakgedakru/trigedasleng) at deploy time. If you want to fork this repo and change the source, you will need to modify the `import-dictionary.sh` script in the root of this repo.

## Acknowledgements

This site is built using a slightly modified version of [Arise](https://github.com/spectrasecure/arise). Please reference the Arise documentation for more information as to how this site works. Site code is licensed under AGPLv3.
