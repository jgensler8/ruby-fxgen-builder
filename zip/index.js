const { execFile } = require('child_process');
const { stream }   = require('stream');
const util = require('util');

/**
 * HTTP Cloud Function.
 *
 * @param {Object} req Cloud Function request context.
 * @param {Object} res Cloud Function response context.
 */
exports.hello = (req, res) => {

  const child = execFile('bash', ['./ruby_entryscript'], (error, stdout, stderr) => {
    console.log(stderr)
    if (error) {
      console.log(stdout)
      res.send(error)
    } else {
      res.send(stdout)
    }
  });

  input = {
    headers: req.headers,
    body: req.body
  }

  child.stdin.write(JSON.stringify(input))
  child.stdin.end()

};
