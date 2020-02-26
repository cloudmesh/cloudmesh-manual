volume
======

.. parsed-literal::

  Usage:
        volume create NAME
                      [--size=SIZE]
                      [--type=VOLUME-TYPE]
                      [--image=IMAGE | --snapshot=SNAPSHOT | --source =VOLUME]
                      [--description=DESCRIPTION]
                      [--dryrun]
        volume delete NAME [--dryrun]
        volume list
                      [--vm=VM NAME]
                      [--region=REGION]
                      [--cloud=CLOUD]
                      [--refresh]
                      [--dryrun]
        volume migrate NAME
                      [--fregion=FROM REGION]
                      [--tregion=TO REGION]
                      [--fservice=FROM SERVICE]
                      [--tservice=TO SERVICE]
                      [--fcloud=FROM CLOUD]
                      [--tcloud=TO CLOUD]
                      [--cloud=CLOUD]
                      [--region=REGION]
                      [--service=SERVICE]
                      [--dryrun]
        volume set NAME
                      [--size=SIZE]
                      [--description=DESCRIPTION]
                      [--state=STATE]
                      [--type=VOLUME-TYPE]
                      [--retype-policy=RETYPE-POLICY]
                      [--bootable | --non-bootable]
                      [--read-only | --read-write]
                      [--dryrun]
        volume show NAME [--dryrun]
        volume sync NAMEA NAMEB
                      [--region=REGION]
                      [--cloud=CLOUD]
                      [--dryrun]
        volume unset NAME
                      [--property=PROPERTY]
                      [--image-property=IMAGE-PROPERTY]
                      [--dryrun]

  A simple abstraction layer to manage Cloud Volumes for AWS, Azure, Google, Openstack and Multipass

  Arguments:
      NAME  volume name
      NAMEA first volume name to sync
      NAMEB second volume name to sync

  Options:
      --size=SIZE                       specify size of volume
      --type=VOLUME-TYPE                specify type of volume
      --image=IMAGE                     specify source
      --description=DESCRIPTION         specify description
      --vm=VM NAME                      specify the name of vm
      --region=REGION                   specify the region
      --cloud=CLOUD                     specify the provider
      --refresh                         refresh
      --fregion=FROM REGION             specify the region where the volume is moving from
      --tregion=TO REGION               specify the region where the volume is moving to
      --fservice=FROM SERVICE           specify the service where the volume is moving from
      --tservice=TO SERVICE             specify the service where the volume is moving to
      --fcloud=FROM CLOUD               specify the provider where the volume is moving from
      --tcloud=TO CLOUD                 specify the provider where the volume is moving to
      --cloud=CLOUD                     specify the provider where the volume is moving within
      --region=REGION                   specify the region where the volume is moving within
      --service=SERVICE                 specify the service where the volume is moving within
      --state=STATE                     specify the state of the volume
      --retype-policy=RETYPE-POLICY     specify the retype-policy
      --property=PROPERTY               specify key for volume
      --image-property=IMAGE-PROPERTY   specify image-key for volume


  Commands:
    Create volume
      cms volume create NAME
      Optionally you can provide size, volume type, image or description
    Delete volume NAME
    List volume
      cms volume list
      Optionally you can provide vm name, region, provider, refresh
    Migrate volume
      cms volume migrate NAME
      Optionally you can provide fregion, tregion, fservice, tservice, fcloud, tcloud, cloud, region, service
    Set volume
      cms volume set NAME
      Optionally you can provide size, description, state, type, retype policy
    Show volume
      cms volume show NAME
    Volume sync
      cms volume sync NAMEA NAMEB
      Optionally you can provide region, cloud
    Unset volume
      cms volume unset NAME
      Optionally you can provide property, image-property
