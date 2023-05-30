AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG
AZREPO=$AZREPO

#rm -rf .git
#cd ..
#rm -rf $AZREPO
#GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/syncing-test/_git/$AZREPO"
#git clone $GIT_CMD_REPOSITORY

#cp -r testing-sync-to-azure-repo/* $AZREPO/

#cd $AZREPO

git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

git remote set-url --add --push origin https://$AZUSERNAME:$AZPAT@dev.azure.com/$AZORG/syncing-test/_git/$AZREPO

git fetch --unshallow origin

git add .
git commit -m "sync from git to azure"

git push origin syncing-branch:arrival-branch --force
