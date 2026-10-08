# The canonical install block

One install story, one wording. `README.md` and `CHANGELOG.md` must say this and nothing else. Change it here first, then propagate.

- **Claude Code:** `claude plugin marketplace add bernard-ng/skills`, then `claude plugin install science-research-writing-skills@bernard-ng` for research and `claude plugin install software-design-skills@bernard-ng` for engineering.
- **skills.sh (Codex and other agents):** `npx skills@latest add bernard-ng/skills` for the whole set; `npx skills@latest add bernard-ng/skills --skill=<name>` and `npx skills@latest update <name>` for one skill. `skills@latest` is the pinned spelling.
- **The routes are exclusive.** The plugin is a managed bundle; skills.sh writes files you own. Installing both duplicates every skill.
- **Install the set together.** Research skills link to the research router and phrase banks in other skills' `references/` folders. Engineering skills link to the engineering routers (`responsibility-driven-design` and `domain-driven-design`). When a user picks a subset in skills.sh, tell them to include the relevant bucket router.

The `bernard-ng/skills` repository path is an assumption; correct it here if the published location differs.
