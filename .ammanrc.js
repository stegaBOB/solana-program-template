// @ts-check
'use strict';
const path = require('path');
const accountProviders = require('./packages/sdk/dist/generated/accounts');

const localDeployDir = path.join(__dirname, 'program', 'target', 'deploy');
const MY_PROGRAM_ID = require("./packages/sdk/idl/my_program_name.json").metadata.address;

function localDeployPath(programName) {
    return path.join(localDeployDir, `${programName}.so`);
}

const programs = [
    {
        label: 'my_program_name',
        programId: MY_PROGRAM_ID,
        deployPath: localDeployPath('my_program_name')
    },
];

const accounts = [
    {
        label: 'Token Metadata Program',
        accountId:'metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s',
        // marking executable as true will cause Amman to pull the executable data account as well automatically
        executable: true,
    },
    {
        label: 'Random other account',
        accountId:'4VLgNs1jXgdciSidxcaLKfrR9WjATkj6vmTm5yCwNwui',
        // by default executable is false
        // providing a cluster here will override the accountsCluster field
        cluster: 'https://metaplex.devnet.rpcpool.com'
    }
];

const validator = {
    programs,
    // The accounts below is commented out. Uncomment if you want to pull remote accounts. Check Amman docs for more info
    accounts,
    verifyFees: false,
    limitLedgerSize: 10000000,
};

module.exports = {
    validator,
    relay: {
        accountProviders,

    },
};