
# pull latest version from account
latest_released_version=`curl --silent https://account.fusionauth.io/api/version -o - | jq 'last(.versions[-1])'|sed 's/"//g'`

# let us override to pull down a particular version
if [ "x$1" != "x" ]; then
  latest_released_version=$1
fi

# pull the theme-history down

git clone git@github.com:FusionAuth/fusionauth-theme-history.git fusionauth-theme-history
cd fusionauth-theme-history
git pull origin --tags

latest_theme_version=`git tag|tail -1`

# see if they match
# if they do, exit
if [ $latest_released_version == $latest_theme_version ]; then
  echo "versions the same"
  exit 0
fi

# if they do not then

# pull down theme helper
cd ..
git clone git@github.com:FusionAuth/fusionauth-theme-helper.git fusionauth-theme-helper

# stand up fusionauth instance
# TODO

# create .env for theme helper
cd fusionauth-theme-helper

cat << EOF > .env
API_KEY=bf69486b-4733-4470-a592-f1bfce7af580
THEME_ID=75a068fd-e94b-451a-9aeb-3ddb9a3b5987
FUSIONAUTH_URL=http://localhost:9011
TMP_DIR=tmp # a temporary directory; this will be created
EOF

# download theme
./download.sh

# copy to history

cp tmp/*.ftl ../fusionauth-theme-history/themes

# check it in
cd ../fusionauth-theme-history
git commit -m "$latest_released_version themes" .
git tag $latest_released_version

# push that up


