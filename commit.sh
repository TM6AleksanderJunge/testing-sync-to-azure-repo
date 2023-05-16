AZPAT=$AZPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG
AZREPO=$AZREPO
#git clone https://github.com/TM6AleksanderJunge/testing-sync-to-azure-repo/tree/syncing-branch

#cd testing-sync-to-azure-repo

rm -rf .git
cd ..
rm -rf $AZREPO
GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZPAT@dev.azure.com/$AZORG/syncing-test/_git/$AZREPO"
git clone $GIT_CMD_REPOSITORY

cp -r testing-sync-to-azure-repo/* $AZREPO/

cd $AZREPO

git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

git add .
git commit -m "sync from git to azure"

git push
