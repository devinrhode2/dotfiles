console.log('sync.js running on dir:', process.cwd())

const chokidar = require('chokidar');
const shell = require('shelljs');
const log = console.log.bind(console);

if (!shell.which('git')) {
    shell.echo('Sorry, this script requires git');
    shell.exit(1);
}

const autoCommit = () => {
    const status = shell.exec('git status --porcelain').stdout;
    if (status !== '') {
        console.log('git status shows these changes:\n  '+status+'\n\nAttempting to commit and push');
        if (shell.exec('git add . && git commit -m "sync" && git push').code !== 0) {
            shell.echo('Error: Git command failed');
            // shell.exit(1);
        }
    }
    return 'autoCommit ran';
};

autoCommit();
chokidar.watch(process.cwd(), {
    ignored: ['Program Overview/Timelines/2019/IT only/**', '**/.git'],
    ignoreInitial: true,
    persistent: true,
    usePolling: true
}).on('all', (event, path) => {
    log(event, path);
    autoCommit();
    return;
});