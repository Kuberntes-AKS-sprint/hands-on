const http = require('http');
const os = require('os');

console.log("Sprint Server starting...");

var handler = function(request, response) {
    console.log("Received Request from" + request.connection.remoteAddress);
    response.writeHead(200);
    response.end("스프린트 Pod " + os.hostname() + "생성 되었습니다."+"\n");
};

var www = http.createServer(handler);
www.listen(8080);