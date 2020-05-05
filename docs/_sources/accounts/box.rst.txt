Box Account
===========

Box provides a cloud file sharing service for businesses. Clients exists
for Windows, MacOS, and Linux. To obtain an account you have to first
visit the box home page as

-  https://www.box.com/home

Sign up
-------

To sign up for the account, click on the top right hand corner of the
box `homepage <https://www.box.com/home>`__ on the ``Get Started``
button.



.. list-table:: Set up a box account
   :widths: 10 40 50
   :header-rows: 1

   * - Step
     - Description
     - Screenshot
   * - 1
     - You will see the Home page
     - |box-start-1|
   * - 2
     - | select the ``Individual`` tab and then
       | click on the free option.
     - |box-start-2|
   * - 3
     - | Chose an Individual plan, fill out the
       | required information and click ``Submit``.
       | You will receive a confirmation email with
       | a link to verify your account.
     - |box-start-3|
   * - 4
     - | Once you have verified your account and
       | signed in, you will be taken to a page
       | that asks you about how you are using Box.
       | You may fill this out or click
       | ``Skip this and go straight to Box`` below
       | the ``Next`` button.
     - |box-start-3|
   * - 5
     - | Create an App
       |
       | You will see the Home page Navigate to the
       | `developer console <https://app.box.com/developers/console>`__
       | and select ``Create New App``. You will need
       | to select what type of application you are
       | building and an authentication method for
       | your app and then enter an app name (you
       | can change this later). Once your app has
       | been created, click View App. You will then
       | need to click the profile button in the top
       | right corner of the page, and go to
       | ``Account Settings``. Scroll down to the
       | Authentication section and click
       | ``Require 2-step verification for
       | unrecognized logins``, then follow the prompts.
     -
   * - 6
     - | Authenticate with JWT
       |
       | In the Configuration panel of the Developer
       | Console, scroll down to the section titled
       | ``Add and Manage Public Keys`` and click
       | ``Generate a Public/Private Keypair``.
       | Once you have generated a keypair, a
       | ``config.json`` file will automatically
       | downloaded. Save this file in a secure
       | location as you will need it for
       | authentication purposes. We recommend storing
       | it at ``~/.cloudmesh/box/config.json``.
       | This will avoid that you conflict with
       | another file called ``config.json``
     - |box-key|


References
----------

*  https://developer.box.com/reference

.. |box-start-1| thumbnail:: images/box/get_started.png
.. |box-start-2| thumbnail:: images/box/individual_plan.png
.. |box-start-3| thumbnail:: images/box/information.png
.. |box-start-4| thumbnail:: images/box/skip.png
.. |box-key| thumbnail:: images/box/box_add_key.png

