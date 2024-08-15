# copy to history

cp tmp/*.ftl ../fusionauth-theme-history/themes

# check it in
cd ../fusionauth-theme-history

git status

git commit -m "$latest_released_version themes" .
git tag $latest_released_version

# push that up
git tag

# TODO

