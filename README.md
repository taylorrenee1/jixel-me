# Jixel-Me

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-brightgreen.svg)](https://github.com/yourusername/repo/releases)

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Previews](#previews)
- [Support](#support)
- [License](#license)

## Description

This is a simple /me /do /action /med /sign resource for your server!


## Installation

1. Download the latest release from the [Releases](https://github.com/taylorrenee1/jixel-me/releases) page.
2. Extract the files into your `resources` folder.
3. Add the resource to your `server.cfg`:

    ```lua
    ensure jixel-me
    ```

## Configuration

This is mostly standalone - however there is one QBCore call in the server which just calls for the CID. Change that to your own core's call to get an identifier of your choosing.

In the Config if you would like to log /me's and /do's (highly recommended for any server) turn `Config.LogMessages` to `true`.

If you use loki logger you can leave "loki" otherwise it will then look for a webhook link for discord.

## Previews

### Me Preview
![Me](https://i.ibb.co/gJdkYS8/image.png)

### Do Preview
![Do](https://i.ibb.co/yYkpkYw/image.png)

### Action Preview
![Action](https://i.ibb.co/NNz9GQq/image.png)

### Med Preview
![MED](https://i.ibb.co/HhS7G2d/image.png)

### Sign Preview
![SIGN](https://i.ibb.co/4JqWBHC/image.png)

## Support

For support, join the [Discord](https://discord.gg/jixelpatterns)

For other scripts visit our [Tebex Store](https://jixeltay.tebex.io).

## License

This project is licensed under the MIT License
