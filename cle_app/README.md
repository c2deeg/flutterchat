# DriveCLE

A mobile application for the cloud-based logistics system for drivers of the CLE Logistics company.

## Prerequisites

- Flutter framework installed on your workstation. [Get Started][https://docs.flutter.dev/get-started/install]
- An IDE(Intergrated Development Enviroment) installed. We recommend [VSCode][https://code.visualstudio.com/]
- Flutter added to your PATH environment (optional)

## Installation

To install the project follow the following steps.

1. Download or clone this repository.
2. Open in IDE.
3. Run a compatible device simulator or plug in a physical test device.
4. Run `Flutter run`

## Deployment

_Until you are supplied with a central google api key you will need to aquire your own. You can get one [here][https://mapsplatform.google.com/pricing/]. Its free for the first ~25000 requests Be aware you will need to provide google with a credit card for verification. They state they will not charge you until you go over the limit so for your financial protection we advise using a vcc (virtual credit card). Alternativly you can wait until we aquire an API KEY for testing._
**Google API Key (with google maps enabled for iOS and Android):** First you need to define your google API key in the _AppDelegate.swift_ and _AndroidManifest.xml_.

Additionaly in the constats.dart file inside lib/util/config you will need to set your google API key to be able to make requests to the google maps API in other locations.

## API Reference & Documentation

API BASE URL: https://logistics.tainosystems.com/api/v1

[Ping](https://logistics.tainosystems.com/api/v1/ping)

[Documentation](https://scm.tainosystems.com/Tainosystems/LogisticsManagementSystems/src/branch/master/docs/docswagger.json)

## Running Test

Currently no testing framework installed. TBD.

## Additional Resources

- Flutter
  For help getting started with Flutter development, view the
  [online documentation](https://docs.flutter.dev/), which offers tutorials,
  samples, guidance on mobile development, and a full API reference.
