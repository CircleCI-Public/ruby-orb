# Ruby Orb
[![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/ruby-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/ruby-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/circleci/ruby)](https://circleci.com/orbs/registry/orb/circleci/ruby) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/CircleCI-Public/ruby-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

Easily cache and install your Ruby Gems automatically, run parallel RSpec tests or Rubocop checking, or just install Ruby.


## Usage

Example use-cases are provided on the orb [registry page](https://circleci.com/orbs/registry/orb/circleci/ruby#usage-examples). Source for these examples can be found within the `src/examples` directory.

**Example**

View the CircleCI Ruby Rails Demo app complete with full config utilizing our Node and Ruby orbs.
https://github.com/CircleCI-Public/circleci-demo-ruby-rails/


## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/circleci/ruby) - The official registry page of this orb for all versions, executors, commands, and jobs described.  
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.  

### How To Contribute

We welcome [issues](https://github.com/CircleCI-Public/ruby-orb/issues) to and [pull requests](https://github.com/CircleCI-Public/ruby-orb/pulls) against this repository!

To publish a new production version:
* Create a PR to the `Alpha` branch with your changes. This will act as a "staging" branch.
* When ready to publish a new production version, create a PR from `Alpha` to `master`. The Git Subject should include `[semver:patch|minor|release|skip]` to indicate the type of release.
* On merge, the release will be published to the orb registry automatically.

For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/ecosystem/orbs).
