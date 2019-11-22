const chalk = require('chalk');
const http = require('http');
const fs = require('fs');
url = 'http://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar';
console.log('[' + chalk.green.bold('OK') + chalk.reset('] Packages and Settings loaded!\n'));

const file = fs.createWriteStream("./server/server.jar");

console.log('[' + chalk.yellow.bold('DOWNLOADING') + chalk.reset('] Please wait... Now downloading server.jar!'));
const download = http.get(url, function(response) {
	response.pipe(file);
	file.on('finish', function() {
		console.log('[' + chalk.green.bold('OK') + chalk.reset('] server.jar has been saved!'));
		file.close();
    });
	
	fs.writeFile("./server/installed.txt", 'You have a 1.14.4 server currently installed!', function(err) {
		if(err) {return console.log('[' + chalk.red.bold('ERROR') + chalk.reset(`] Could not save installed.txt (not enough space on HDD/SSD?)`));}
		console.log('[' + chalk.green.bold('OK') + chalk.reset('] Saved installed.txt file (shows current version installed).'));
	});
	
	fs.writeFile("./server/ram.txt", '512M', function(err) {
		if(err) {return console.log('[' + chalk.red.bold('ERROR') + chalk.reset(`] Could not save ram.txt (not enough space on HDD/SSD?)`));}
		console.log('[' + chalk.green.bold('OK') + chalk.reset('] ram.txt file created/overwriten.'));
	});
	
	fs.writeFile("./server/ram.txt.example", 'Do not use this file as your ram.txt!\nYou will use this to determine how\nmuch RAM you would like to allocate\nto your server.\n\nTo allocate 1 GB of RAM, you would\ndo 1G or 1024M. A recommended amount\nis 1024M but if that does not work\ntry doing 512M then 256M.', function(err) {
		if(err) {return console.log('[' + chalk.red.bold('ERROR') + chalk.reset(`] Could not save ram.txt.example (not enough space on HDD/SSD?)`));}
		console.log('[' + chalk.green.bold('OK') + chalk.reset('] ram.txt.example file created/overwriten.'));
	});
	fs.writeFile("./server/eula.txt", 'eula=true', function(err) {
		if(err) {return console.log('[' + chalk.red.bold('ERROR') + chalk.reset(`] Could not save eula.txt (not enough space on HDD/SSD?)`));}
		console.log('[' + chalk.green.bold('OK') + chalk.reset('] EULA Agreement updated to true, if you do not agree cancel installation now.'));
	});
	console.log('[' + chalk.blue.bold('INFO') + chalk.reset('] To start the server go to the "server" folder and run start-server.bat or start-server.sh!'));
	}).on('error', (err) => {
		fs.unlink('./server/server.jar');
		console.log(`\n${chalk.red.bold(err.code)}\n${chalk.red.bold(err.message)}\n`);
});