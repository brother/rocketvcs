#!/bin/bash
# Friday lab project at GleSYS.
# 2017-05-05: Martin Bagge / brother <martin.bagge@glesys.se>
#
# TODO : Fully replace the git tag command.
# TODO : Just compact the master branch, don't remove the .git
#        folder... keeping support for development branches and such...
# TODO : Compact git log and use the titles as rows in annotation
#        body. "Changelog". Maybe add it to a changelog file instead?

oldwd=$(pwd)
if [[ ${oldwd##*/} == ".git" ]]; then
	echo "Need to be in git root not GIT_DIR. Moving one step up."
	cd ..
	oldwd=$(pwd)
fi
if ! wd=$(git rev-parse --show-toplevel); then
	echo "This does not look like a git repository."
	exit 128
fi

# Moving working space to git root
if [[ $(pwd) != "$wd" ]]; then
	cd "$wd" || exit
fi

while getopts "m:b" option; do
	case "$option" in
		m)
			opt_message=$OPTARG ;;
		b)
			opt_animation=yes ;;
		*)
			echo "-m text version"
			exit 1
	esac
done
shift $((OPTIND-1))
tagname=$1

if [[ -z $opt_message ]]; then
	echo "Need annotation message."
	exit 1
fi

if [[ -z $tagname ]]; then
	# If the user omits the tagname just reuse the annotation message
	# but replace spaces with dash.
	tagname=${opt_message// /-}
fi

rm -Rf .git/
git init -q
git add .
# TODO Will repeat tagname if tagname was empty..."
git commit -q -F - <<-EOF
	$tagname

	$opt_message
EOF
if [[ $opt_animation == "yes" ]]; then
	cat <<-'EOF'
		                     `. ___
		                    __,' __`.                _..----....____
		        __...--.'``;.   ,.   ;``--..__     .'    ,-._    _.-'
		  _..-''-------'   `'   `'   `'     O ``-''._   (,;') _,'
		,'________________                          \`-._`-','
		 `._              ```````````------...___   '-.._'-:
		    ```--.._      ,.                     ````--...__\-.
		            `.--. `-`                       ____    |  |`
		              `. `.                       ,'`````.  ;  ;`
		                `._`.        __________   `.      \'__/`
		                   `-:._____/______/___/____`.     \  `
		                               |       `._    `.    \
		                               `._________`-.   `.   `.___
		                                             SSt  `------'`
	EOF
fi
git tag -m "$opt_message" "$tagname"

cd "$oldwd" || exit
