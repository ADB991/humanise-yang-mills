# Access for contributors and agents

Use individual GitHub accounts. A repository role grants permission to an account;
a personal access token authenticates that account within its allowed permissions.
Giving somebody the owner's token lets them authenticate as the owner. Do not
distribute a shared owner token to contributors. See GitHub's
[credential guidance](https://docs.github.com/en/rest/authentication/keeping-your-api-credentials-secure).

## Public contribution model

For a public repository, ordinary contributors use their own accounts to discuss
tasks, fork the repository, and submit pull requests. They do not need an invitation
or write access to the canonical repository. Their agents use their authentication
and follow the same workflow. See GitHub's
[contribution guide](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-open-source).

On a personally owned repository, add only trusted coordinators and integrators
as collaborators: this grants write access. Personal repositories do not offer a
separate issue-triage role. See
[personal repository permissions](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/repository-access-and-collaboration/permission-levels-for-a-personal-account-repository).

For a growing project, consider organisation ownership. Suggested roles:

| Participant | Role |
| --- | --- |
| Public contributor or mathematical reviewer | No special repository access |
| Task coordinator | Triage, for assignments and existing labels |
| Trusted integrator | Write |
| Repository manager | Maintain, if needed |
| Small group responsible for access and settings | Admin |

Public reviewers can provide mathematical reports without write access. GitHub's
required-approval gate uses reviewers with write access; an authorised integrator
can check those reports and provide the merge approval. See
[organisation roles](https://docs.github.com/en/organizations/managing-user-access-to-your-organizations-repositories/managing-repository-roles/repository-roles-for-an-organization).

For a private project, readers also need access. Organisation ownership permits
read-only invitations; private personal repositories give collaborators write access.

GitHub Project permissions are separate: dashboard coordinators need Project Write
in addition to the relevant permissions on task issues. See the
[Projects and Agents guide](github-features.md).

## Authenticate an agent

Contributors sign in under their own accounts through their tool's GitHub connection
or GitHub CLI (`gh auth login`). Give an agent access only to the authentication
needed for its assigned work; a normal CLI login may cover other repositories too.
Keep credentials in the tool's secret/credential store, outside prompts and Git.
See the [CLI login documentation](https://cli.github.com/manual/gh_auth_login).

Where supported, use an expiring fine-grained token limited to the relevant
repositories and operations. GitHub currently lists limitations for fine-grained
tokens used by outside collaborators and public contributors; a token for someone's
own fork may not support upstream issue comments or PR creation. Use a supported
login/App flow rather than asking for the owner's token. See
[token capabilities and limitations](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens).

A shared project bot, if later needed, should use a GitHub App installed only on
this repository with the permissions its job needs. A claim coordinator does not
need content-writing or administration rights. Keep the bot's credentials with its
operator rather than distributing them to participants. See
[GitHub Apps](https://docs.github.com/en/apps/creating-github-apps/about-creating-github-apps/about-creating-github-apps).

## Protect integration

Require reviewed PRs and passing checks on `main`, block force pushes/deletion,
and apply the protections to administrators and automation as well. Repository
instructions alone do not enforce those restrictions. See
[branch protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches).

An owner token can remain private for the owner's own work. If it has already been
distributed or exposed, revoke it and replace any legitimate uses with appropriately
scoped credentials. This guide does not change GitHub permissions or revoke tokens.
