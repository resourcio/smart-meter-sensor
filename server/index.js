var express = require("express");
const port = process.env.PORT || 8081;
const path = require("path");
const myArgs = process.argv.slice(2);

var app = express();
var version;
var versionPath;

switch (myArgs[0]) {
  case 'dev':
    console.log('Dev mode');
    app.use(express.static(path.join(__dirname, "/..")));
    versionPath = path.join(__dirname, "/..", "version.txt");
    break;
  default:
    console.log('Production mode');
    app.use(express.static("smartmetersensor"));
    versionPath = path.join("smartmetersensor", "version.txt");
}

// read version file only at startup
const fs = require('fs');
try {
  versionContent = fs.readFileSync(versionPath, 'utf8');
  var vers = versionContent.split("=");  
  console.log(vers[1]);
  if(vers[1]){
    version = vers[1]
  }
} catch (err) {
  console.error(err);
}

app.get('/version', (req, res) => {
  return res.send(version);
});

var server = app.listen(port, function () {
  var port = server.address().port;
  console.log("Server started at http://localhost:%s", port);
});
