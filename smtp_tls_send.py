#!/usr/bin/env python3
import sys
import getopt
import getpass
import smtplib

def main(argv):
    try:
        opts, args = getopt.getopt(argv, "hs:u:", ["server=","user="])
    except getopt.GetoptError:
        print('smtp_tls_send.py -s <server> -u <user>')
        sys.exit(1)
    for opt, arg in opts:
        if opt == '-h':
            print('smtp_tls_send.py -s <server> -u <user>')
            sys.exit()
        elif opt in ("-s", "--server"):
            s_server = arg
        elif opt in ("-u", "--user"):
            s_user = arg
    # get password
    s_pw = getpass.getpass(prompt="Enter user's password: ")

    i_port = 587
    s_from = 'jijisa@iorchard.co.kr'
    l_to = ['jijisa@skbsec.local']
    s_subj = 'test TLS mail using python smtplib'
    s_body = 'This is a test mail using python smtplib'

    # initialize connection to our email server, we will use Outlook here
    smtp = smtplib.SMTP(s_server, port=i_port)

    smtp.ehlo()  # send the extended hello to our server
    smtp.starttls()  # tell server we want to communicate with TLS encryption

    smtp.login(s_user, s_pw)  # login to our email server

    # send our email message
    s_msg = 'From: {}\nSubject: {}\n\n{}'.format(s_from, s_subj, s_body)
    smtp.sendmail(s_from, l_to, s_msg)

    smtp.quit()  # finally, don't forget to close the connection

if __name__ == '__main__':
    main(sys.argv[1:])

