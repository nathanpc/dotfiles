# Name and From.
set realname = "Nathan Campos"
set from = "nathan@innoveworkshop.com"

# IMAP and SMTP.
set imap_user = $from
set folder = "imaps://imap.gmail.com:993"
set imap_pass = $my_pass_nathan_innove
set smtp_url = "smtp://$from@smtp.gmail.com:587/"
set smtp_pass = $my_pass_nathan_innove

set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set header_cache = ~/.mutt/$from-mail/cache/headers
set message_cachedir = ~/.mutt/$from-mail/cache/bodies
set certificate_file = ~/.mutt/$from-mail/certificates

# vim: set ft=muttrc:

