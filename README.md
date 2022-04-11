# Ruby Orb
[![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/ruby-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/ruby-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/circleci/ruby.svg)](https://circleci.com/orbs/registry/orb/circleci/ruby) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/CircleCI-Public/ruby-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

Easily cache and install your Ruby Gems automatically, run parallel RSpec tests or Rubocop checking, or just install Ruby.


## Usage

Example use-cases are provided on the orb [registry page](https://circleci.com/orbs/registry/orb/circleci/ruby#usage-examples). Source for these examples can be found within the `src/examples` directory.

**Example**

View the CircleCI Ruby Rails Demo app complete with full config utilizing our Node and Ruby orbs.
https://github.com/CircleCI-Public/circleci-demo-ruby-rails/


## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/circleci/ruby) - The official registry page of this orb for all versions, executors, commands, and jobs described.  
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.  

### How to Contribute

We welcome [issues](https://github.com/CircleCI-Public/ruby-orb/issues) to and [pull requests](https://github.com/CircleCI-Public/ruby-orb/pulls) against this repository!

### How to Publish An Update
1. Merge pull requests with desired changes to the main branch.
    - For the best experience, squash-and-merge and use [Conventional Commit Messages](https://conventionalcommits.org/).
2. Find the current version of the orb.
    - You can run `circleci orb info circleci/ruby | grep "Latest"` to see the current version.
3. Create a [new Release](https://github.com/CircleCI-Public/ruby-orb/releases/new) on GitHub.
    - Click "Choose a tag" and _create_ a new [semantically versioned](http://semver.org/) tag. (ex: v1.0.0)
      - We will have an opportunity to change this before we publish if needed after the next step.
4.  Click _"+ Auto-generate release notes"_.
    - This will create a summary of all of the merged pull requests since the previous release.
    - If you have used _[Conventional Commit Messages](https://conventionalcommits.org/)_ it will be easy to determine what types of changes were made, allowing you to ensure the correct version tag is being published.
5. Now ensure the version tag selected is semantically accurate based on the changes included.
6. Click _"Publish Release"_.
    - This will push a new tag and trigger your publishing pipeline on CircleCI.
