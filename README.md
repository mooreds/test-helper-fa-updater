This repo updates the fusionauth-theme-history repo. It exists only for that purpose.

The reason not to put all these scripts in that fusionauth-theme-history repo is to keep that git history clean.

This is a combination of shell scripts and GH workflow.

It depends on there being a GH PAT available to commit the fusionauth-theme-history repo from a workflow starting here.

## More Details

We first check the versions of FusionAuth (as defined by account) and versions of themes (as defined by tags). If these match, we're done.

If they don't, we stand up a version of FusionAuth inside the GitHub action, pull down the default advanced theme (using `fusionauth-theme-helper`), and then add it to the repo. It uses the `ks/ks.json` file to initialize the FusionAuth instance, and tests to see that the API key works.

`bin` contains all the scripts, but they can't be used entirely outside of GitHub actions because GH actions does some of the fiddling with the repositories (cloning, etc).

## Future Improvements

We don't handle backports of fixes currently.

Would be nice for the scripts to work transparently whether in or out of GH actions.

