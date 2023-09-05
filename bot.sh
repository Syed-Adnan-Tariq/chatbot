#!/usr/bin/env bash
NAME=$1
echo "Cleaning ai/pre_built_bots"
sudo rm -rf ai/pre_built_bots/$NAME

echo "Cleaning ai/ui_domains"
sudo rm -rf ai/ui_domains/$NAME

echo "Syncing ai/pre_built_bots"
rsync -av -e 'ssh -p 4422' --exclude='models' muhammad.basit@35.174.127.142:/u/thumbcrowd/ai/pre_built_bots/$NAME ai/pre_built_bots

echo "Syncing ai/ui_domains"
rsync -av -e 'ssh -p 4422' muhammad.basit@35.174.127.142:/u/thumbcrowd/ai/ui_domains/$NAME ai/ui_domains/
