# Changelog

All notable changes to this project are documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

## [0.2.0]

### Changed
- **Breaking:** require Ruby >= 3.1 and `i18n` >= 1.8.
- `translate` and `localize` take keyword options (`**options`) instead of a positional hash.
- Development tooling: RSpec ~> 3.13, RuboCop ~> 1.60, `bin/console` uses IRB (`pry` removed).

### Fixed
- `translate` and `localize` options (`locale:`, `default:`, `count:`, interpolation, `format:`) work on Ruby 3.
- `KeyBuilder#build` no longer mutates its memoized scope.
- Anonymous classes raise a descriptive `ArgumentError` instead of `NoMethodError`.

### Added
- GitHub Actions CI, Dependabot configuration, gemspec metadata, CONTRIBUTING guide.

## [0.1.2]
- Previous release.
