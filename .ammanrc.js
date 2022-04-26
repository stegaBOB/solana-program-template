// @ts-check
'use strict';
const path = require('path');
const accountProviders = require('./js/dist/generated/accounts');

const localDeployDir = path.join(__dirname, 'program', 'target', 'deploy');
const MY_PROGRAM_ID = require("./js/idl/my_program_name.json").metadata.address;

function localDeployPath(programName) {
    return path.join(localDeployDir, `${programName}.so`);
}

const programs = [
    {
        label: 'my_program_name',
        programId: MY_PROGRAM_ID,
        deployPath: localDeployPath('my_program_name')
    },
    // Example of a program without a local .so file
    // {
    //     label: 'token_metadata',
    //     programId: 'metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s',
    // },
];

const validator = {
    programs,
    verifyFees: false,
    limitLedgerSize: 10000000,
};

module.exports = {
    validator,
    relay: {
        accountProviders,
    },
};