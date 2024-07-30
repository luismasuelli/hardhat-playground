const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("PlaygroundTokens", (m) => {
  const fakeCoin = m.contract(
    "FakeCoin", []
  );
  const fakeCollection = m.contract(
    "FakeCollection", []
  );
  const fakeEcosystem = m.contract(
    "FakeEcosystem", []
  );

  return { fakeCoin, fakeCollection, fakeEcosystem };
});
