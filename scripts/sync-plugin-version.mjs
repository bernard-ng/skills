#!/usr/bin/env node
// Copies package.json's version into every plugin entry of .claude-plugin/marketplace.json.
// Runs as part of `npm run version`, immediately after `changeset version`.
// With --check it changes nothing and exits 1 if any plugin version differs.

import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const repo = join(dirname(fileURLToPath(import.meta.url)), "..");
const marketplacePath = join(repo, ".claude-plugin", "marketplace.json");

const { version } = JSON.parse(readFileSync(join(repo, "package.json"), "utf8"));
const marketplace = JSON.parse(readFileSync(marketplacePath, "utf8"));
const plugins = marketplace.plugins ?? [];

const stale = plugins.filter((plugin) => plugin.version !== version);

if (stale.length === 0) {
  console.log(`marketplace.json plugin versions are ${version} (already in sync)`);
  process.exit(0);
}

if (process.argv.includes("--check")) {
  for (const plugin of stale) {
    console.error(`${plugin.name} is ${plugin.version}, package.json is ${version}.`);
  }
  console.error("Run `node scripts/sync-plugin-version.mjs`.");
  process.exit(1);
}

for (const plugin of stale) {
  console.log(`${plugin.name} ${plugin.version} -> ${version}`);
  plugin.version = version;
}

// The skills lists are long, so keep the two-space layout the file already uses.
writeFileSync(marketplacePath, `${JSON.stringify(marketplace, null, 2)}\n`);
