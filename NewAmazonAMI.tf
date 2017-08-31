#This terraform file will find the most recent Amazon Linux AMI for use on instances

data "aws_ami" "amazon" {
	most_recent = true #will only return the most recent AMI
	
	#checks that the owner of the AMI is Amazon, so an official Amazon Linux AMI
	filter {
		name   = "owner-alias" #checks that the owner of the AMI is Amazon
		values = ["amazon"]
	}
	
	#Makes sure that the AMI is for a hardware virtual machine, can be changed to PV if Paravertual needed
	filter {
		name = "virtualization-type"
		values = ["hvm"]
	}
	
	# Will filter out things like Amazon Deep Learning AMIs, only getting the base AMI
	filter {
		name = "name" #makes sure you get the base Amazon AMI
		values = ["amzn-ami*x86_64-gp2"]
	}
}
