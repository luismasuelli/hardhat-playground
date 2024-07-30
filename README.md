# New Hardhat Project
A hardhat projects boilerplate. Meant to be used as a template.

# Installation
Prior to doing anything, install everything:

```shell
npm install
```


# Project contents
This project comes with many pre-installed dependencies:

1. `hardhat-common-tools`: Common tools for ethers and viem. Base to other packages.
2. `hardhat-enquirer-plus`: New prompts under `hre.enquirerPlus.Enquirer` (and `hre.enquirerPlus.Enquirer.prompt`).
3. `hardhat-servers`: The `npx hardhat serve` scope and tasks.
4. `hardhat-blueprints`: The `npx hardhat blueprint` scope and `hre.blueprint` utilities.
5. `hardhat-method-prompts`: The `npx hardhat invoke` scope and `hre.methodPrompts` utilities.
6. `hardhat-ignition-deploy-everything`: The `npx hardhat ignition deploy-everything` command and
   `hre.ignition.everything` utilities.
7. `hardhat-openzeppelin-common-blueprints`: Blueprints and invocations for OpenZeppelin ERC-20 / 721 / 1155.
8. `hardhat-contract-sizer`: The `npx hardhat size-contracts` task.
9. `@openzeppelin/contracts`: The OpenZeppelin contracts.
10. `@chainlink/contracts`: The Chainlink contracts.
11. `@nomicfoundation/hardhat-toolbox`: The Hardhat Toolbox (ethers) plug-ins set.
12. `@nomicfoundation/hardhat-ignition`: The Hardhat Ignition plug-in.
13. `@nomicfoundation/hardhat-ignition-ethers`: The Hardhat Ignition Ethers plug-in.

In order to understand the plug-ins, properly read the documentations:

1. [Documentation for hardhat-common-tools](https://github.com/AlephVault/hardhat-common-tools)
2. [Documentation for hardhat-enquirer-plus](https://github.com/AlephVault/hardhat-enquirer-plus)
3. [Documentation for hardhat-servers](https://github.com/AlephVault/hardhat-servers)
4. [Documentation for hardhat-blueprints](https://github.com/AlephVault/hardhat-blueprints)
5. [Documentation for hardhat-method-prompts](https://github.com/AlephVault/hardhat-method-prompts)
6. [Documentation for hardhat-ignition-deploy-everything](https://github.com/AlephVault/hardhat-ignition-deploy-everything)
7. [Documentation for hardhat-openzeppelin-common-blueprints](https://github.com/AlephVault/hardhat-openzeppelin-common-blueprints)

You can get an understanding by reading [this tutorial](https://medium.com/@luismasuelli/the-easy-way-to-hardhat-introduction-a21d734fdaba).
Each of the parts 2 to 8 document one of these (new) packages.

# Usage

First, mount a local node:

```shell
npx hardhat node
```

Then, deploy everything in a separate console:

```shell
npx hardhat ignition deploy-everything run --reset --network localhost
```

## Fake Tokens

There are three fake token contracts already created. Examples on how to interact with them:

```shell
# These are the 3 names, deployed in a single Hardhat Ignition module, of the token contracts.
# These instructions are only balance-of instructions, but you'll get the idea if you took a
# look to the hardhat-method-prompts article / documentation on how to use other methods.
npx hardhat invoke erc721:balance-of --address 0 --deployed-contract-id "PlaygroundTokens#FakeCoin" --network localhost
npx hardhat invoke erc721:balance-of --address 0 --deployed-contract-id "PlaygroundTokens#FakeCollection" --network localhost
npx hardhat invoke erc1155:balance-of --address 0 --token-id 1 --deployed-contract-id "PlaygroundTokens#FakeEcosystem" --network localhost
```