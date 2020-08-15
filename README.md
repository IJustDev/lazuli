<div align="center">
    <img width="320px" src="./resources/lapis-logo.svg"/>
    <h1>Lazuli</h1>
    <h3>An Amazon product importer</h3>
</div>

<div align="center">

![Gem](https://img.shields.io/gem/dt/lazuli?style=for-the-badge)
![Version](https://img.shields.io/gem/v/lazuli?style=for-the-badge)

<a href="https://www.buymeacoffee.com/IJustDev" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-violet.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>

</div>

## Table of Contents
1. [What the fuck is this?](#what-the-fuck)
2. [Usage](#usage)
2. [Installation](#installation)

## What the fuck
This is an repository that is intended for transforming an Amazon product into an Jekyll post or any other kind of post using the templaing eninge eruby.

## Usage

![Preview][preview]

First of all you need to create an config file located at your home directory.
```sh
$ cat ~/.lazuli.conf
# Cat output
access_key=<your_access_key_here>
secret_key=<your_secret_key_here>
partner_tag=<your_partner_key_here>
```

Then run following command
```sh
$ lazuli
```

## Installation
1. *You need to have Ruby and Ruby Gems installed.*
```sh
$ gem install lazuli
```
If this does not work try it with sudo privileges.

[preview]: resources/preview.svg
