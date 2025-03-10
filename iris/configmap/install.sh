function install () {

mkdir /tmp/main

# Read the repository URL from install.json
repoUrl=$(jq -r '.repoUrl' install.json)

wget --quiet -O- \
  --header="Accept: application/vnd.github+json" \
  --header="X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$repoUrl/tarball | tar zxf - --directory /tmp/main --strip-components=1

iris session iris < /tmp/main/iris/configmap/install.script

iris session iris < /tmp/main/iris/configmap/config.script

rm -fr /tmp/main

}

install

exit 0