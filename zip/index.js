const { execFile } = require('child_process');

/**
 * HTTP Cloud Function.
 *
 * @param {Object} req Cloud Function request context.
 * @param {Object} res Cloud Function response context.
 */
exports.hello = (req, res) => {
  // Do some conversion from req to stdin and environment variables

  const child = execFile('bash', ['./ruby_entryscript'], (error, stdout, stderr) => {
    if (error) {
      console.log(stdout)
      console.log(stderr)
      res.send(error)
    } else {
      res.send(stdout)
    }
  });
};
