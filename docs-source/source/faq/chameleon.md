# FAQ chameleon cloud

All FAQ's related to chameleon cloud asume 

1. you have looked at the instances with horizon before you use `cms`
2. `cms` is installed 
3. `cms init` worked and 



## How check if chmaeleon cloud works


```bash
cms set cloud=chameleon
cms flavor list --refresh
```

This returns the list of fkavors

## How do I upload my key to chameleon?

```bash
cms key upload --cloud=chameleon
cms key list --cloud=chameleon
```

## What is the error ...?

1. If you get this error

    ```
    UnboundLocalError: local variable 'key' referenced before assignment
    ```
    
    then you have not uploade your key to chameleon

## What is the chameleon account bug?

Preriquisite:

1. We assue you start by deleting your .cloudmesh directory and have install a
   proper version of cms.


2. Before you do anything verify if you can remember your password. You must
   logout of the chameleon cloud.org dashboart and login, while not using an auto
   completion Web password completer. Make sure to remove your password if you use
   one of them.

Chameleon has several strange bugs we know of that will hopefully be fixed

1. Any account in chameleon that wants to use OpenStack KVM **must** first
   visit horizon and through the visit activate the acoount. The activation via
   the e-mail that they send to you does not fully activate your account.

2. When activation your account in horizon, you meust login to a login screen.
   However, sometimes we observed that screen do not complete the activation and
   you do not get forwarded to horizon. INstead you end in an endless loop for
   activation requests.

3. Some students despite the issue of being able to login reported that they
   can not use cms even though they typed in the password correctly. To find this
   out you have to talk to Gregor which unfortunately needs your username and
   password. to verify if your account works or not.

4. If Gregor can verify that your account works (e.g. he does this on a
   computer on which we checked chameleon cloud works for another account), you
   will have to apply for a new chameleon account with an e-mal that has not been
   used at

   * University of Chicago
   * Indiana University
   * jetstream
   * XSEDE
   * Chameleon Cloud
  
   Than you do the previous steps and check if you can use this account in cms.
   If it works fine, if it does not file a ticket with chameleon cloud.

Gregor completely hats to do 3. and 4. but chameleon cloud have not provided
any proper solutions.

