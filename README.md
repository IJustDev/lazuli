<div align="center">
    <img src="./resources/lapis-logo.svg"/>
    <h1>Lazuli</h1>
    <h3>An Amazon product importer</h3>
</div>

## Table of Contents
1. [What the fuck is this?](#what-the-fuck)
2. [Usage](#usage)
2. [Installation](#installation)

## What the fuck
This is an repository that is intended for transforming an Amazon product into an Jekyll post.


## Usage

![Preview][preview]

First of all you need to create an config file located at your home directory.
```sh
$ cat ~/.lazuli.conf
# access_key=<your_access_key_here>
# secret_key=<your_secret_key_here>
# partner_tag=<your_partner_key_here>
```

Then run following command
```sh
lazuli
```

## Installation
1. *You need to have ruby and RubyGems installed.*
```sh
$ gem install lazuli
```
If this does not work try it with sudo privileges.

[preview]: resources/preview.svg
