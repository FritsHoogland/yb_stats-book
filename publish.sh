#
# This is copied from https://github.com/rust-lang/mdBook/wiki/Automated-Deployment%3A-GitHub-Pages
#
git worktree add ./gh-pages
#
mdbook build
#
rm -rf ./gh-pages/* # this won't delete the .git directory
#
cp -rp book/* ./gh-pages/
#
cd ./gh-pages
#
git add -A
#
git commit -m 'deploy new book'

git push origin gh-pages

cd -
