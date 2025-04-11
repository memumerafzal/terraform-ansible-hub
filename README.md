## 🚀 Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows (recommended)



#### Steps to setup the Project:

- Create project folder name "terraform-ansible-nginx" and open it through VS Code
- Create files and subdirectories as mentioned below

#### 📁 Project Structure look like this
terraform-ansible-nginx/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── ansible/
│   ├── hosts
│   ├── playbook.yml
│   └── files/
│       └── index.html
│
├── README.md
└── run.sh



## 🔧 How It Works

1. **Terraform** provisions the infrastructure:
   - Launches an EC2 instance
   - Creates a security group with HTTP access
   - Generates a private key used by Ansible

2. **Ansible** installs and configures Nginx:
   - Installs Nginx on the instance
   - Deploys a custom `index.html` page

---

##### Step 1: Deploy & Initialize Terraform Project
    cd terraform
    terraform init
    terraform apply -auto-approve

- NOTE: COPY THE GENERATED PUBLIC IP FROM THE OUTPUT.

######  Step 2: Configure Ansible Inventory
- Go to the ansible/ folder.
- Update the ansible/hosts file with the EC2 instance public IP:


    [web]
    <your-ec2-public-ip> ansible_user=ubuntu ansible_ssh_private_key_file=../terraform/keys/autoansible.pem
    

###### Step 3: Run Ansible Playbook


    cd ansible
    ansible-playbook -i hosts playbook.yml --private-key ../terraform/keys/autoansible.pem


###### Step 4: Access the Web Server
Open your browser and go to:
https://13.56.85.211 # Put here your own IP
