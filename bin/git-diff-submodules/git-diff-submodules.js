#!/usr/bin/env node

const shell = require('shelljs');
const log = console.log.bind(console);

if (!shell.which('git')) {
    shell.echo('Sorry, this script requires git');
    shell.exit(1);
}

const changedSubmodulesCliOutput = shell.exec(
    'git diff --submodule=log centene-port -- src/app/q360-comps',
    {silent: true}
).stdout;
let changedSubmodules = changedSubmodulesCliOutput.trim().split('\n');

changedSubmodules = changedSubmodules
    .filter(line => !line.startsWith('  > '))
    .filter(line => !line.startsWith('  < '))
    ;

changedSubmodules = changedSubmodules
    .map(line => line.replace('Submodule src/app/q360-comps/', ''))
    .map(line => line.split(' ')[0])
    ;

shell.exec(
    'cd src/app/q360-comps; ' +
    changedSubmodules.map(line => 
        'cd '+line+'; '+
            'echo "SUBMODULE '+line.toUpperCase()+' ON BRANCH $(git rev-parse --abbrev-ref HEAD;)"; '+
            'echo ""; '+
            "git diff centene-port -- . ':(exclude)package-lock.json' ':(exclude)dist'; "+
        'cd ..; '
    ).join('') +
    'cd ../../..; '
);



// if (status !== '') {
//     console.log('git status shows these changes:\n  '+status+'\n\nAttempting to commit and push');
//     if (shell.exec('git add . && git commit -m "sync" && git push').code !== 0) {
//         shell.echo('Error: Git command failed');
//         // shell.exit(1);
//     }
// }


// const 

// git diff --submodule=short centene-port -- src/app/q360-comps


// echo "Listing changes for super module"
// git diff $1 --name-only
// subs=(`git submodule | awk '{print $2}'`)
// for sub in ${subs[*]}; do
//    lastrevision=`git diff  $1 $sub | fgrep "Subproject" | head -n1 | awk '{print $3}'`
//    cd $sub
//    echo "Listing changes for $sub"
//    git diff $lastrevision --name-only
//    cd ..
// done