# Proviso Ec2 Plugin

This plugin gives you the ability to easily spin up and down ec2 servers, 
using a simple command line instruction.

## How to install?

    gem install proviso
    
    gem install amazon-ec2
    
    proviso plugins:install git://github.com/jackhq/proviso_ec2.git
    
    # Create or Update proviso.yml file for configuration 
    
    # The proviso.yml file needs to be in the current working directory.
    
    # create a node called ec2: and add the following criteria:
    
    # image_id: ami-2d4aa444
    # availability_zone: us-east-1c
    # key_name: ec2-keypair
    # security_group: default
    # max_count: 1
    
    # Also make sure you have the environment varibles for ec2 setup:
    # AMAZON_ACCESS_KEY_ID
    # AMAZON_SECRET_ACCESS_KEY
    
    ## Future releases will let you specify these settings from the command line...
    
    # Ok if you have everything configured, you should be able to do the following:
    
    # List Ec2 Servers
    proviso ec2:list
  
    # Create Ec2 Server
    proviso ec2:create
    
    # Shutdown Ec2 Server
    proviso ec2:remove [instance_id]
    
    # Status of Ec2 Server
    proviso ec2:status [instance_id]
    
## TODO

* Enable settings to be passed in the command line
* Enable key and secret key to passed in the yaml file
* Allow to remove server by specifing ip or url
* Allow to get status of server by ip or url

    
    