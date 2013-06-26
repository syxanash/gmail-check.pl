##gmail-check.pl
### Yet another GMail check script

**gmail-check.pl** is my own private script which checks my GMail box.

##Synopsis

```
perl gmail-check.pl [--options] <parameters>

General Options:
  --cli                 Run the program from the command line without zenity
  --version             Show the current release version
  --read=CONFIG FILE    Specify the path of the configuration file to read
  --help                Show this very useful help of course!
```

##Description

This script allows you to check your Gmail box. You have three ways to
run the script, default way is by using zenity to compile the fields
and get the number of messages. CLI way instead, do not need zenity or
notify-osd and runs the program directly from the command line. The
third way --read, allows you to check the mail box automatically simply
by specifing the path where the configuration file is located. The
configuration file is an JSON file and should contain the username and
the password of you GMail account.

##JSON configuration

here's an example of how you should write your JSON configuration file

```json
{
    "accounts":
    [
        {
            "username": "chandler_bing",
            "password": "SongvEtel188"
        },
        {
            "username": "ross.geller",
            "password": "PaintEusebE113"
        }
    ]
}
```

##Installation

This script requires the tools **notify-osd**, **zenity** and **mpg123** which can be
easily installed (if you're on a Debian-like distro), by the following command:

```sh
apt-get install zenity mpg123
```

otherwise if you're using a different distro, these tools will probably
be listed into the relative package manager.

You also need various Perl modules to make this script work, here's the list:

* [LWP::UserAgent](http://search.cpan.org/~gaas/libwww-perl-6.04/lib/LWP/UserAgent.pm) -- (already installed)
* [XML::Simple](http://search.cpan.org/~grantm/XML-Simple-2.20/lib/XML/Simple.pm) -- (probably installation required)
* [JSON](http://search.cpan.org/~makamaka/JSON-2.59/lib/JSON.pm) -- (installation required)
* [Getopt::Long](http://search.cpan.org/~enrys/POD2-IT-Getopt-Long/lib/POD2/IT/Getopt/Long.pm) -- (probably installation required)
* [File::Slurp](http://search.cpan.org/~uri/File-Slurp-9999.19/lib/File/Slurp.pm) -- (installation required)
* [Pod::Usage](http://perldoc.perl.org/Pod/Usage.html) -- (already installed)
* [version](http://search.cpan.org/~jpeacock/version-0.99/lib/version.pod) -- (already installed)
* [Data::Dumper](http://search.cpan.org/~smueller/Data-Dumper-2.139/Dumper.pm) -- (don't remember, probably installation required)

After installing all the required libraries, type the command:

```sh
make install
```

and the script gmail-check.pl, contained into this package, will be automatically copied into /usr/bin/

##Screenshot

Some of the notification status:

![gmail-check.pl screenshot](http://i.imgur.com/v3EbTLC.png "gmail-check.pl screenshot")

Zenity input example:

![gmail-check.pl screenshot](http://i.imgur.com/TtsLD3p.png "Zenity input example")

##License
### gmail-check.pl is released under the DWTFYWT:

```
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 
 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.
 
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. Do what you want cause a pirate is FREE.
```

##About

This script was developed by Simone 'syxanash', if you have any kind of suggestions, criticisms, or bug fixes please let me know in some ways :-)