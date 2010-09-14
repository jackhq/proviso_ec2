require 'AWS'
require 'yaml'

module Proviso::Command
  class Ec2 < Base

    attr_accessor :access_key_id, :secret_access_key, :image_id, :key_name, :max_count, :availability_zone, :security_group, :instance_type

    def initialize(args)
      @args = args
      load_config
      @ec2 = establish_connection
       
    end
    

    def list
      @ec2.describe_instances().reservationSet.item.map do |i| 
        puts (i.instancesSet.item.first["dnsName"] || "Name Not Available") + ' ' + (i.instancesSet.item.first["instanceId"] || '') 
      end
    end
    
    def create
      puts @ec2.run_instances(
        :image_id               =>                  @image_id, 
        :key_name               =>                  @key_name, 
        :max_count              =>                  @max_count,
        :availability_zone      =>                  @availability_zone,
        :security_group         =>                  @security_group,
        :instance_type          =>                  @instance_type
      ).inspect 
    end
    
    def remove
      if @args.length == 1
        @ec2.terminate_instances(:instance_id => @args.first)
        display "Successfully removed server.", true
      else
        error "instance_id required: eg. proviso ec2:remove [instance_id]"
      end
      
    end
    
    def status
      if @args.length == 1
        display @ec2.describe_instances(:instance_id => @args.first).reservationSet.item.first.instancesSet.item.first.inspect, true
      else
        error "instance_id required: eg. proviso ec2:status [instance_id]"        
      end 
    end
    
    def establish_connection
      AWS::EC2::Base.new(:access_key_id => @access_key_id, :secret_access_key => @secret_access_key)      
    end
    
    def load_config
      if File.exists?(yaml_file)
        ec2_config = YAML.load_file(yaml_file)["ec2"]
        @access_key_id = get_option_value('access_key_id', ec2_config)
        @secret_access_key = get_option_value('secret_access_key', ec2_config)
        @image_id = get_option_value('image_id', ec2_config)
        @availability_zone = get_option_value('availability_zone', ec2_config)
        @key_name = get_option_value('key_name', ec2_config)
        @security_group = get_option_value('security_group', ec2_config)
        @max_count = get_option_value('max_count', ec2_config)
        @instance_type = get_option_value('instance_type', ec2_config)
        display "Config File Loaded...", true
      else
        error "proviso.yml config file not found."
      end
    end
    
    def get_option_value(option, config)
      extract_option("--#{option}") or config[option]
    end
    
    
        
  end
  
  
end

