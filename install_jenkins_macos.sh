#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Jenkins on Debian-based systems
install_jenkins_debian() {
    echo "Installing Jenkins on Debian-based system..."
    sudo apt update
    sudo apt install -y openjdk-11-jdk wget gnupg
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install -y jenkins
    echo "Jenkins installed successfully."
}

# Function to install Jenkins on Red Hat-based systems
install_jenkins_rhel() {
    echo "Installing Jenkins on Red Hat-based system..."
    sudo yum install -y java-11-openjdk wget
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo yum install -y jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    echo "Jenkins installed successfully."
}

# Function to install Jenkins on macOS
install_jenkins_mac() {
    echo "Installing Jenkins on macOS..."
    if ! command_exists brew; then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install jenkins-lts
    echo "Jenkins installed successfully."
}

# Function to guide Windows users
install_jenkins_windows() {
    echo "Detected Windows operating system."
    echo "Please follow these steps to install Jenkins:"
    echo "1. Download Jenkins from the official website: https://www.jenkins.io/download/"
    echo "2. Install Java if not already installed: https://www.oracle.com/java/technologies/javase-jdk11-downloads.html"
    echo "3. Run the Jenkins Windows installer and follow the setup instructions."
    echo "4. Jenkins will be available as a Windows service and accessible at http://localhost:8080 after installation."
}

# Main script logic
echo "Detecting operating system..."
if [ -f /etc/debian_version ]; then
    install_jenkins_debian
elif [ -f /etc/redhat-release ]; then
    install_jenkins_rhel
elif [[ "$OSTYPE" == "darwin"* ]]; then
    install_jenkins_mac
elif [[ "$OS" == "Windows_NT" ]]; then
    install_jenkins_windows
else
    echo "Unsupported operating system. Please install Jenkins manually."
    exit 1
fi

echo "Installation complete. Start Jenkins by running the appropriate service start command for your OS."


