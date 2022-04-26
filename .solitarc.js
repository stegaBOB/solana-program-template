const path = require('path');
const programDir = path.join(__dirname, 'program');
const idlDir = path.join(__dirname, 'js','idl');
const sdkDir = path.join(__dirname, 'js', 'src', 'generated');
const binaryInstallDir = path.join(__dirname, '.crates');

module.exports = {
    idlGenerator: 'shank',
    programName: 'my_program_name',
    idlDir,
    sdkDir,
    binaryInstallDir,
    programDir,
};