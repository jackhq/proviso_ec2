# Proviso Ec2 Plugin

This plugin gives you the ability to easily spin up and down ec2 servers, 
using a simple command line instruction.

## How to install?

    gem install proviso
    
    gem install amazon-ec2
    
    proviso plugins:install git://github.com/jackhq/proviso_ec2.git
    
    # Create configuration     
    # create a node called ec2: and add the following criteria:
    
    proviso config:create ec2
    
    proviso config:add access_key_id [your access key]
    proviso config:add secret_access_key [your secret access key]
    proviso config:add image_id ami-2d4aa444
    proviso config:add availability_zone us-east-1c
    proviso config:add key_name ec2-keypair
    proviso config:add security_group default
    proviso config:add max_count 1
    
    proviso config:list 
    
    you should see your config setting listed in config output
        
    # List Ec2 Servers
    proviso ec2:list
  
    # Create Ec2 Server
    proviso ec2:create
    
    # Shutdown Ec2 Server
    proviso ec2:remove [instance_id]
    
    # Status of Ec2 Server
    proviso ec2:status [instance_id]
    
    # You can also override any parameter from the command line
    
    proviso ec2:create --image_id [my awesome image]
    
## TODO

* Allow to remove server by specifing ip or url
* Allow to get status of server by ip or url

    
    