#!/bin/bash

read -p "Enter Minecraft Username: " username
read -p "Enter UUID (from NameMC): " uuid

if [[ -z "$username" || -z "$uuid" ]]; then
  echo "Error: Username or UUID is empty"
  exit 1
fi

uuid_clean=${uuid//-/}

lunar_path="$HOME/.var/app/com.lunarclient.LunarClient/.lunarclient/settings/game"
accounts_file="$lunar_path/accounts.json"

mkdir -p "$lunar_path"

cat > "$accounts_file" <<EOF
{
  "activeAccountLocalId": "$uuid_clean",
  "accounts": {
    "$uuid_clean": {
      "accessToken": "$uuid_clean",
      "accessTokenExpiresAt": "2050-07-02T10:56:30.717167800Z",
      "eligibleForMigration": false,
      "hasMultipleProfiles": false,
      "legacy": true,
      "persistent": true,
      "userProperites": [],
      "localId": "$uuid_clean",
      "minecraftProfile": {
        "id": "$uuid_clean",
        "name": "$username"
      },
      "remoteId": "$uuid_clean",
      "type": "Xbox",
      "username": "$username"
    }
  }
}
EOF

echo "Success: Account $username added!"
echo ""
echo "File content:"
cat "$accounts_file"
