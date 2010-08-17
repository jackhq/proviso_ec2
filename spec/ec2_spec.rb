require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Proviso Ec2 Command" do
  before(:each) do
    hash = {"ec2" => {"access_key_id"=>"12345", "secret_access_key"=>"54321", "image_id"=>"ami-2d4aa444", "availability_zone"=>"us-east-1c", "key_name"=>"ec2-keypair", "security_group"=>"default", "max_count"=>1}}
    YAML.stub!(:load_file).and_return(hash)  
    AWS::EC2::Base.should_receive(:new).and_return(true)
  end
  
  it "initialize should should override config" do
    p = Proviso::Command::Ec2.new(['--image_id','12345','--access_key_id', '54321'])
    p.image_id.should == '12345'
    p.access_key_id.should == '54321'
    p.availability_zone.should == "us-east-1c"
  end
  
  # 
  # it "should create ec2"
  # it "should remove ec2"
    
  
end