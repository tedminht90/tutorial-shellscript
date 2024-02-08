#!/usr/bin/env bash

project="${1}"
branch="${2}"

#check project is empty
if [[ -z "${project}" ]]; then
   echo "Error: Git project not specified"
   exit 1
fi

project_dir="$(basename ${project} .git)"

clone_project() {
  if [ ! -d "/home/bob/git/${project_dir}" ]; then
    cd /home/bob/git/
    git clone "${project}"
  fi
}

git_checkout() {
  cd  "/home/bob/git/${project_dir}"
  #check branch is not empty
  if [[ ! -z "${branch}" ]]; then
    git checkout "${branch}" ||  echo "Error: Branch ${branch} doesn't exist in ${project}." exit 1; exit 1
  fi
}

find_files() {
  find . -type f | wc -l
}
clone_project
git_checkout
find_files