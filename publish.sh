cat Unity-Logs-Viewer/package.json | jq 'del(.version)' | jq '. + { "version": "sdkver" }'>>tmp
mv tmp Unity-Logs-Viewer/package.json
sed -i '' 's/sdkver/'"$1"'/'  Unity-Logs-Viewer/package.json
git add -A
git commit -m "uv"
git pull
git push
git subtree split --prefix=Unity-Logs-Viewer --branch upm
git tag $1 upm
git push origin upm --tags
