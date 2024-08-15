
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
  echo "keepgoing=false" >> "$GITHUB_OUTPUT"
  exit 0
fi
