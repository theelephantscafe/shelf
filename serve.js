// Serves the app at http://localhost:4173 so it runs at a real web address
// instead of as a file. Stop it any time with Ctrl-C.
const http = require('http'), fs = require('fs'), path = require('path');
const ROOT = __dirname;
const TYPES = {'.html':'text/html','.js':'text/javascript','.css':'text/css','.json':'application/json'};

http.createServer((req, res) => {
  let f = decodeURIComponent(req.url.split('?')[0]);
  if (f === '/') f = '/index.html';
  const p = path.join(ROOT, f);
  if (!p.startsWith(ROOT) || !fs.existsSync(p) || fs.statSync(p).isDirectory()) {
    res.writeHead(404); return res.end('Not found');
  }
  res.writeHead(200, {'Content-Type': TYPES[path.extname(p)] || 'application/octet-stream'});
  fs.createReadStream(p).pipe(res);
}).listen(4173, () => {
  console.log('\n  Paige is running.  Open:  http://localhost:4173\n  Press Ctrl-C to stop.\n');
});
