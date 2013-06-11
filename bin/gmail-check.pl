#!/usr/bin/perl

use strict;
use warnings;

use LWP::UserAgent;
use XML::Simple;
use Pod::Usage;
use Getopt::Long;
use version;
use Term::ReadKey;

our $VERSION = qv('0.0.1');

my %actions = (
    cli     => q{},
    version => q{},
    read    => q{},
);

my $icon_path       = '/usr/share/icons/gmail-check.png';
my $error_icon_path = '/usr/share/icons/gmail-check-error.png';

my $gmail_username = q{};
my $gmail_password = q{};

my $email_num = 0;

GetOptions(
    'help'    => sub { pod2usage(1); },
    'cli'     => \$actions{cli},
    'version' => \$actions{version},
    'read=s'  => \$actions{read},
);

die "Version: $VERSION\n"
  if ( $actions{version} );

# check if the CLI interface is enabled

if ( $actions{cli} ) {
    print 'Username: ';
    chomp( $gmail_username = <STDIN> );

    print 'Password: ';

    ReadMode('noecho');
    chomp( $gmail_password = ReadLine(0) );
    ReadMode('normal');

    print "\n";

    $email_num = get_email_num( $gmail_username, $gmail_password );

    die "[!] Can't fetch the number of messages from Gmail!\n"
      unless ($email_num);

    print 'mails found: ', $email_num, "\n";

    exit;
}

# check if all the tools have been installed on the system

if ( $ENV{"PATH"} ne q{} ) {
    if ( !check_env_path() ) {
        die '[!] Please install the tools required, before running this script!', "\n";
    }
}

# check all the accounts saved into the
# configuration file config.xml

if ( $actions{read} ) {

    my $data = XMLin( $actions{read} );

    foreach my $i ( @{ $data->{account} } ) {
        $email_num = get_email_num( $i->{username}, $i->{password} );

        ($email_num)
          ? system 'notify-send -u normal -i '
          . $icon_path
          . " 'Gmail' 'mails found for "
          . $i->{username}
          . ": $email_num'"
          
          : system 'notify-send -u critical -i '
          . $error_icon_path
          . " 'Gmail Error' 'cannot find any email for "
          . $i->{username} . "'";
    }

    exit;
}

# run the gmail check with zenity interface

chomp( $gmail_username = `zenity --entry --text="Username:" --title="Gmail Checker"` );
chomp( $gmail_password = `zenity --password --title="Gmail Checker"` );

if ( $gmail_username eq q{} or $gmail_password eq q{} ) {
    system 'zenity --error --text="Please enter a valid username or password!"';
    die "[!] Username or password are empty!\n";
}

$email_num = get_email_num( $gmail_username, $gmail_password );

if ( !$email_num ) {
    system 'zenity --error --text="Can\'t fetch the number of messages from Gmail!"';
    die "[!] Can't fetch the number of messages from Gmail!\n";
}

system 'notify-send -u normal -t 120000 -i '
  . $icon_path
  . " 'Gmail' 'mails found: $email_num'";

# get_email_num() sub function used
# to return the number of the emails

sub get_email_num {
    my $username = shift;
    my $password = shift;

    my ( $lwp_useragent, $lwp_response, $http_request, $xml_response );

    $lwp_useragent = LWP::UserAgent->new();
    $lwp_useragent->agent("GMail Checker");

    # make the http request

    $http_request = HTTP::Request->new( 'GET' => "https://mail.google.com/gmail/feed/atom", );

    $http_request->authorization_basic( $username, $password );

    # send the request

    $lwp_response = $lwp_useragent->request($http_request);

    # return false if the connection fails

    return 0
      unless ( $lwp_response->is_success );

    # get the xml content

    $xml_response = XMLin( $lwp_response->content );
    return $xml_response->{fullcount};
}

# check if the tools required are installed...
# return the number of the tools required

sub check_env_path {

    my $check_bin = 0;

    my %binaries = (
        notify => 'notify-send',
        zenity => 'zenity',
    );

    foreach my $path ( split /:/, $ENV{"PATH"} ) {
        foreach my $binary ( keys %binaries ) {
            if ( -e ( $path . '/' . $binaries{$binary} ) ) {
                $check_bin++;
            }
        }
    }

    return 0
      unless ( $check_bin == scalar keys %binaries );

    return $check_bin;
}

__END__

=pod

=head1 NAME

gmail-check.pl - do I need to invent a name too?

=head1 SYNOPSIS

perl gmail-check.pl [--options] <parameters>

 General Options:
  --cli                 Run the program from the command line without zenity
  --version             Show the current release version
  --read=CONFIG FILE    Specify the path of the configuration file to read
  --help                Show this very useful help of course!

=head1 DESCRIPTION

This script allows you to check your Gmail box.
You have three ways to run the script, default way
is by using zenity to compile the fields and get
the number of messages. CLI way instead, do not need
zenity or notify-osd and runs the program directly
from the command line. The third way --read, allows you to
check the mail box automatically simply by specifing
the path where the configuration file is located.
The configuration file is an XML file and should contain
the username and the password of you GMail account.

=head1 DEPENDENCIES

LWP::UserAgent ~ http://search.cpan.org/~gaas/libwww-perl-6.04/lib/LWP/UserAgent.pm

XML::Simple ~ http://search.cpan.org/~grantm/XML-Simple-2.20/lib/XML/Simple.pm

Getopt::Long ~ http://search.cpan.org/~enrys/POD2-IT-Getopt-Long/lib/POD2/IT/Getopt/Long.pm

version ~ http://search.cpan.org/~jpeacock/version-0.99/lib/version.pod

Pod::Usage ~ http://perldoc.perl.org/Pod/Usage.html

=head1 SEE ALSO

Zenity manual at http://library.gnome.org/users/zenity/stable/

Getopt::Long and Pod::Usage http://perldoc.perl.org/Getopt/Long.html#Documentation-and-help-texts

=head1 LICENSE AND COPYRIGHT

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 
 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.
 
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. Do what you want cause a pirate is FREE.

=head1 AUTHOR

@syxanash

=cut