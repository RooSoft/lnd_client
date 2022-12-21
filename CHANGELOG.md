# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `decode_payment_request` to decode a payment request

### Changed

- `LndClient.start_link` and `LndClient.start` accept `LndClient.ConnConfig` struct
- Remove `LndClient.connect` (`LndClient` connects automatically to LND when it starts up)
