include .env

aws.ec2-ssh-into:
	ssh -i $(ansible_ssh_private_key_file) $(ansible_user)@$(public_dns)
	
aws.ec2-create-instace:
	aws ec2 run-instances --image-id ami-0a313d6098716f372 --key-name terraform-study --security-groups launch-wizard-3 --instance-type t2.micro --placement AvailabilityZone=us-east-1c
	
aws.ec2-show-instances:
	aws ec2 describe-instances

aws.ec2-list-public-ips:
	aws ec2 describe-instances --instance-ids $(JENKINS_STUDY) --query "Reservations[*].Instances[*].PublicIpAddress"  --output=text

aws.start-instances:
	aws ec2 start-instances --instance-ids $(JENKINS_STUDY)
	
aws.stop-instances:
	aws ec2 stop-instances --instance-ids $(JENKINS_STUDY)
	
aws.reboot-instance:
	aws ec2 reboot-instances --instance-ids $(JENKINS_STUDY)

ansible.execute:
	ansible-playbook $(FILE) --extra-vars "ansible_host=$(ansible_host) ansible_user=$(ansible_user) ansible_ssh_private_key_file=$(ansible_ssh_private_key_file)" 
	
ansible.ping:
	ansible all -m ping --extra-vars "ansible_host=$(ansible_host) ansible_user=$(ansible_user) ansible_ssh_private_key_file=$(ansible_ssh_private_key_file)"