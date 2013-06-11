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
configuration file is an XML file and should contain the username and
the password of you GMail account.

##XML configuration

here's an example of how you should write your XML configuration file

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<accounts>
    <account>
        <username>chandler_bing</username>
        <password>SongvEtel188</password>
    </account>
    <account>
        <username>ross.geller</username>
        <password>PaintEusebE113</password>
    </account>
</accounts>
```

##Installation

This script requires the tools **notify-osd** and **zenity**, which can be
easily installed (if you're on a Debian-like distro), by the following command:

```sh
apt-get install zenity
```

otherwise if you're using a different distro, these tools will probably
be listed into the relative package manager.

You also need various Perl modules to make this script work, here's the list:

* [LWP::UserAgent](http://search.cpan.org/~gaas/libwww-perl-6.04/lib/LWP/UserAgent.pm) -- (already installed)
* [XML::Simple](http://search.cpan.org/~grantm/XML-Simple-2.20/lib/XML/Simple.pm) -- (probably installation required)
* [Getopt::Long](http://search.cpan.org/~enrys/POD2-IT-Getopt-Long/lib/POD2/IT/Getopt/Long.pm) -- (probably installation required)
* [Pod::Usage](http://perldoc.perl.org/Pod/Usage.html) -- (already installed)
* [version](http://search.cpan.org/~jpeacock/version-0.99/lib/version.pod) -- (already installed)
* [Data::Dumper](http://search.cpan.org/~smueller/Data-Dumper-2.139/Dumper.pm) -- (don't remember, probably installation required)

After installing all the required libraries, type the command:

```sh
make install
```

and the script gmail-check.pl, contained into this package, will be automatically copied into /usr/bin/

##Screenshot

![gmail-check.pl screenshot](http://i.imgur.com/Pb10fz9.png "gmail-check.pl screenshot")

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