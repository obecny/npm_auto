if ! git diff-index --quiet HEAD --; then
  echo ""
  echo "You have uncommitted changes, please commit them before continuing"
  echo ""
  echo "operation aborted"
  echo ""
  exit 0
fi

git fetch --tags
lastTag=`git tag | grep -E '^v\d+.+' | tail -1`;

if [ -z "$lastTag" ]; then
  newTag="v0.1"
  echo "No previous tag found, using default: $newTag";
else
  version=`echo $lastTag | grep -Eo '\.{1}[0-9]+$'`;
  oldVersion=`echo $lastTag | grep -Eo '[0-9]+$'`;
  newVersion=".$(($oldVersion + 1))";
  newTag="${lastTag/$version/$newVersion}"
fi
#

checkNpm=`node "./scripts/check-npm.js"`;
if [ -z "$checkNpm" ];
then
  echo "This version has not been released yet, will create a tag $newTag";
else
  echo "ERROR";
  echo "$checkNpm";
  echo "No tag has been created";
  echo "Please fix the error and try again";
  exit;
fi

echo "All checks passed, do you want to create a new tag with name \"$newTag\" ?"
echo "Please choose \"1\" to proceed"
choices=("Yes" "No")
select choice in ${choices[@]}
do
    echo $choice
    break
done

if [ "$choice" = "Yes" ]; then
  git tag $newTag;
  echo "New tag \"$newTag\" created";
fi

#git tag | xargs git tag -d