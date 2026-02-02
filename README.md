# 🛠️ AWS Shell Scripting for DevOps Automation

![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?style=flat&logo=amazon-aws&logoColor=white)
![Linux](https://img.shields.io/badge/OS-Linux-FCC624?style=flat&logo=linux&logoColor=black)
![DevOps](https://img.shields.io/badge/Role-DevOps-blue?style=flat)

A **DevOps-focused Shell Scripting repository** that demonstrates how **Bash + AWS CLI** can be used to automate cloud resource management tasks such as **listing and deleting AWS resources**.

This project highlights practical scripting skills commonly used in **DevOps, SRE, and Cloud Engineer roles**.

---

## 📌 Implemented Scripts

### 🔹 AWS Resource Listing Script
📄 **`aws_resource_list.sh`**

- Lists AWS resources based on:
  - AWS Region
  - AWS Service name
- Validates command-line arguments
- Uses AWS CLI for real-time cloud interaction
- Useful for audits, monitoring, and environment inspection

**Usage:**
```bash
./aws_resource_list.sh <region> <service>

## 🚀 How to Use

### 1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
chmod +x *.sh
./script_name.sh <region> <service>

