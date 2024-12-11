#!/bin/bash

if [ ! -d fusionauth-theme-history ]; then
  # pull down theme history
  git clone https://github.com/mooreds/test-helper-fa.git fusionauth-theme-history
  git pull origin --tags
fi

# pull down theme helper
git clone https://github.com/FusionAuth/fusionauth-theme-helper.git fusionauth-theme-helper

# create .env for theme helper
cd fusionauth-theme-helper

echo -----
cat download.sh
echo -----

cat<<EOF>download.sh
. .env

echo THEME
echo $THEME_ID

echo npx fusionauth theme:download $THEME_ID -k $API_KEY -o $TMP_DIR -h $FUSIONAUTH_URL

npx fusionauth theme:download $THEME_ID -k $API_KEY -o $TMP_DIR -h $FUSIONAUTH_URL
EOF

npm install

# API key is set in ks/ks.json
cat << EOF > .env
API_KEY=4737ea8520bd454caabb7cb3d36e14bc1832c0d3f70a4189b82598670f11b1bdEXAMPLE
THEME_ID=75a068fd-e94b-451a-9aeb-3ddb9a3b5987
FUSIONAUTH_URL=http://localhost:9011
TMP_DIR=tmp # a temporary directory; this will be created
EOF

cat .env

# download theme
./download.sh

