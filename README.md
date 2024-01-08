PKGi PS3 CN
====

[![Build package](https://github.com/ps3-pkgi/pkgi/actions/workflows/build.yml/badge.svg)](https://github.com/ps3-pkgi/pkgi/actions/workflows/build.yml)

**PKGi PS3 CN** is a chinese lang fork of [pkgi-ps3](https://github.com/bucanero/pkgi-ps3).

The `pkgi-ps3 cn` homebrew app allows to download and install `.pkg` files directly on your PS3.

![image](https://user-images.githubusercontent.com/1153055/71187586-1acaf400-225e-11ea-9531-b18af20be10d.png)

# Features

* **easy to use:** list available downloads, including searching, filtering, and sorting.
* **standalone:** no PC required, everything happens directly on the PS3.
* **automatic downloads:** just choose an item, and it will be downloaded by the app to your HDD (`direct mode`) or queued for background download (`background mode`) using the internal Download Manager.
* **resumes interrupted downloads:** you can stop a download at any time, switch applications, and come back to resume the download later.
* **content activation:** the app can generate `.rif` files for downloaded content (system must be activated)
* **content updates:** the app can check online for available content updates
* **localization support:** Finnish, French, German, Italian, Polish, Portuguese, Spanish, Turkish

### Notes:
* **queuing** up multiple downloads is only supported when using `background download` mode.
* **background download tasks** will only show up after rebooting your PS3.

# Download

Get the [latest version here][pkgi_latest].

# Usage

Using the application is simple and straight-forward: 

 - Move <kbd>UP</kbd>/<kbd>DOWN</kbd> to select the item you want to download, and press ![X button](https://github.com/ps3-pkgi/pkgi/raw/master/data/CROSS.png).
 - To see the item's details, press ![Square](https://github.com/ps3-pkgi/pkgi/raw/master/data/SQUARE.png).
 - To sort/filter/search press ![Triangle](https://github.com/ps3-pkgi/pkgi/raw/master/data/TRIANGLE.png).
It will open the context menu. Press ![Triangle](https://github.com/ps3-pkgi/pkgi/raw/master/data/TRIANGLE.png) again to confirm the new settings, or press ![O button](https://github.com/ps3-pkgi/pkgi/raw/master/data/CIRCLE.png) to cancel any changes.
- Press left or right trigger buttons <kbd>L1</kbd>/<kbd>R1</kbd> to move pages up or down.
- Press <kbd>L2</kbd>/<kbd>R2</kbd> trigger buttons to switch between categories.

### Notes

- **RAP data:** if the item has `.rap` data, the file will be saved in the `/dev_hdd0/exdata/` folder.


# Q&A

1. Where to get a `rap` string? 
   
   You can use a tool like RIF2RAP to generate a `.rap` from your existing `.rif` files. Then you can use a tool like `hexdump` to get the hex byte string.

2. Where to get `.pkg` links?
   
   You can use [PSDLE][] to find `.pkg` URLs for the games you own. Then either use the original URL, or host the file on your own web server.

3. Where to remove interrupted/failed downloads to free up disk space?
   
   Check the `/dev_hdd0/tmp/pkgi` folder - each download will be in a separate `.pkg` file by its title id. Simply delete the file and start again.

4. Download speed is too slow!
   
   Optimization is still pending. If `direct` download is slow, you can use `background download` mode to download files using the internal PS3 Download Manager.

# Credits

* [Bucanero](http://www.bucanero.com.ar/): Project developer
* [mmozeiko](https://github.com/mmozeiko/): [PS Vita pkgi](https://github.com/mmozeiko/pkgi)

# Building

You need to have installed:

- [PS3 toolchain](https://github.com/bucanero/ps3toolchain)
- [pkgi-ps3](https://github.com/bucanero/pkgi-ps3)
- [PSL1GHT](https://github.com/ps3dev/PSL1GHT) SDK
- [Tiny3D](https://github.com/wargio/Tiny3D) library
- [YA2D](https://github.com/bucanero/ya2d_ps3) library (an extended version from my repo)
- [PolarSSL](https://github.com/bucanero/ps3libraries/blob/master/scripts/015-polarssl-1.3.9.sh) library (v1.3.9)
- [libcurl](https://github.com/bucanero/ps3libraries/blob/master/scripts/016-libcurl-7.64.1.sh) library (v7.64.1)
- [MikMod](https://github.com/ps3dev/ps3libraries/blob/master/scripts/011-libmikmod-3.1.11.sh) library
- [Mini18n](https://github.com/bucanero/mini18n) library
- [dbglogger](https://github.com/bucanero/dbglogger) library (only required for debug logging)

Run `make` to create a release build. After that, run `make pkg` to create a `.pkg` install file. 

You can also set the environment variable `PS3LOAD=tcp:x.x.x.x` to the PS3's IP address;
that will allow you to use `make run` and send `pkgi-ps3.self` directly to the [PS3LoadX listener](https://github.com/bucanero/ps3loadx).

## Debugging

To enable debug logging, build PKGi PS3 with `make DEBUGLOG=1`. The application will send debug messages to
UDP multicast address `239.255.0.100:30000`. To receive them you can use [socat][] on your PC:

    $ socat udp4-recv:30000,ip-add-membership=239.255.0.100:0.0.0.0 -

# License

`pkgi-ps3` is released under the [MIT License](LICENSE).

[PSDLE]: https://repod.github.io/psdle/
[socat]: http://www.dest-unreach.org/socat/
[pkgi_downloads]: https://github.com/ps3-pkgi/pkgi/releases
[pkgi_latest]: https://github.com/ps3-pkgi/pkgi/releases/latest
[pkgi_license]: https://github.com/ps3-pkgi/pkgi/blob/master/LICENSE
[img_latest]: https://img.shields.io/github/release/ps3-pkgi/pkgi.svg?maxAge=3600
[img_license]: https://img.shields.io/github/license/ps3-pkgi/pkgi.svg?maxAge=2592000
