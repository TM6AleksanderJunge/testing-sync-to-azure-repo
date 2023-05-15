AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG
git clone https://github.com/TM6AleksanderJunge/testing-sync-to-azure-repo/tree/syncing-branch

cd testing-sync-to-azure-repo
rm -rf .git

cd ..

GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/syncing-test/_git/AzureRepos-syncing"
git clone $GIT_CMD_REPOSITORY

cp -r testing-sync-to-azure-repo/* AzureRepos-syncing/

cd AzureRepos-syncing

git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

git add .
git commit -m "sync from git to azure"

git push