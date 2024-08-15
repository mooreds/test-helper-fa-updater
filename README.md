This repo updates the fusionauth-theme-history repo. It exists only for that purpose.

The reason not to put all these scripts in that fusionauth-theme-history repo is to keep that git history clean.

This is a combination of shell scripts and GH workflow.

It depends on there being a GH PAT available to commit the fusionauth-theme-history repo from a workflow starting here.

It will check to see if the latest version of the tag in the fusionauth-theme-history matches the latest published version of FusionAuth, and abort if they are the same.

Otherwise it downloads the default theme and pushes it up to github.
