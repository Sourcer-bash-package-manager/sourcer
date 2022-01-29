#!/usr/bin/env bash
# find the protocol variable in the fetcher.conf file
protocol=$(grep -oP '(?<=protocol=).*' /etc/fetcher/fetcher.conf)
# find the repo1 variable in the fetcher.conf file
repo=$(grep -oP '(?<=repo=).*' /etc/fetcher/fetcher.conf)
# sourcer - the package manager for shellscripting
if [ help = "$1" ]; then
    echo "  sourcer - the package manager for shellscripting"
    echo "  Usage:" 
    echo "  sourcer dl <package> - download a package"
    echo "  upload <package> - uploads a package to the sourcer git repo (requires configured git)"
    echo "  list             - lists all packages in the .packages directory"
    echo "  help             - display this help message"
    echo "  estabilish       - creates a new project with sourcer" 
    exit 0
fi
if [ "$1" = dl = "$2" ] then
# check if the git repo is downloaded
    if [ ! -d /etc/sourcer/repos/main ]; then
        git clone $protocol://$repo/ /etc/sourcer/repos/
    fi
fi

if [estabilish = "$1"] then
# ask for repo name, dependencies, license, and description
    echo "Please enter the name of the repo you wish to create"
    read repo
    echo "Please enter the dependencies of the repo"
    read dependencies
    echo "Please enter the license of the repo"
    read license
    echo "Please enter the description of the repo"
    read description
    echo "Please enter license of the repo (MIT, GPL, etc)"
    read license
# write those values to package.sh
cd .; echo "repo=$repo" >> package.sh; echo "dependencies=$dependencies" >> package.sh; echo "license=$license" >> package.sh; echo "description=$description" >> package.sh; echo "license=$license" >> package.sh
