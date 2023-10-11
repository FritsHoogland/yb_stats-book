#
# This is copied from https://github.com/rust-lang/mdBook/wiki/Automated-Deployment%3A-GitHub-Pages
#
git worktree add gh-page
#
mdbook build
#
rm -rf ./gh-page/* # this won't delete the .git directory
#
cp -rp book/* ./gh-page/
#
cd ./gh-page
#
git add -A
#
git commit -m 'deploy new book'

git push origin gh-page

cd -
