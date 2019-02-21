# GPwd <span style="opacity:0.4;">Password Manager</span>

## Program for retreiving passwords from an encrypted file and pushing them neatly to the clipboard.

## Requirements:
 * Linux
 * xclip       [clipboard]
 * libsodium   [encryption]

* * *

## Usage:
Note that in all **get** cases, the name of the service doesn't have to be an exact match. The program will find the closest match. If no matches are found, the program will exit with an error message.

## <span style="opacity:0.6;">Set new login details</span>
gpwd set <span style="opacity:0.4;">[name of service]</span> [parameters]
Valid parameters:
>--service -s
>--username -u
>--password -p
>--email -e
>--name -n
>--phone -q
>--info -i
>--domain -d

### Options
<span style="color:#30A1A1;">**-x n**</span> Generate random password of length ***n***. Write to file and copy to clipboard. If ***n*** is omitted, default of 10 is used.
<span style="color:#30A1A1;">**--quiet**</span> Don't write anything to stdout.

Return Values:
[1] <span style="color:#30A140;">Success!</span> [output info]
[0] <span style="color:#A13040;">[Error Message]</span>

Example:
gpwd set -x <span style="opacity:0.4;">8</span> -s <span style="opacity:0.4;">duolingo</span> -u <span style="opacity:0.4;">duobot</span> -p <span style="opacity:0.4;">#bQ#^@b35g</span> -e <span style="opacity:0.4;">superb@email.com</span> -n <span style="opacity:0.4;">"Alice Wonderland"</span> -q <span style="opacity:0.4;">+61411856144</span>

* * *
## Get commands
<span style="opacity:0.6;">**Print the information on a given service**</span>
gpwd info [service(s)]
<span style="opacity:0.4;"></span>

<span style="opacity:0.6;">**List all services**</span>
gpwd list

<span style="opacity:0.6;">**Copy password to clipboard**</span>
gpwd pwd [service]

<span style="opacity:0.6;">**Print login credentials**</span>
gpwd get [service]

* * *
## How does it work?
When a user sets a new service file they will be prompted to enter their master key.
Now, a new file is created with a lowercased filename equal to the entry in **--service**. The file is encrypted with the master key from plaintext, with the contents having the following format:
u <span style="opacity:0.4;">username</span> \n
p <span style="opacity:0.4;">password</span> \n
e <span style="opacity:0.4;">email</span> \n
n <span style="opacity:0.4;">name</span> \n
d <span style="opacity:0.4;">domain</span> \n
q <span style="opacity:0.4;">phone</span> \n
i <span style="opacity:0.4;">info</span> \n

* Necessarily, all newlines in entries will be removed and replaced with spaces.
* Entries which are too long [over 256 chars] will cause the program to exit.

On a get command, the program will likewise request the master key, before decrpyting the file and retreiving the required information.

* * *

