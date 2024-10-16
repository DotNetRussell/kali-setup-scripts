export DEBIAN_FRONTEND=noninteractive

apt update;
apt upgrade -y;

apt-get install dirmngr --install-recommends -y -q

echo 'Installing gpg'
apt install gpg -y -q;

echo 'Configuring public keys'
gpg --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6
gpg -a --export ED444FF07D8D0BF6 | sudo apt-key add -

echo 'Adding kali repos to sources.list'
echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list
echo 'deb-src http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list

echo 'Running update and upgrade'
apt update;
apt upgrade -y -q;

apt install unzip curl git openvpn network-manager-openvpn tmux python-pip aespipe smbclient ftp telnet lynx net-tools -y;

echo 'Installing h@ck3r t00l5'

apt install nmap nikto dirb wfuzz ncat mitmproxy exploitdb wpscan masscan -y -q;
apt install git -y;
apt install python3-psutil;

wget https://raw.githubusercontent.com/DotNetRussell/DomainChecker/master/domainchecker.sh
chmod +x domainchecker.sh
mv domainchecker.sh /usr/bin/domainchecker

apt install sublist3r dnsrecon cadaver recon-ng davtest -y -q;

wget https://github.com/projectdiscovery/nuclei/releases/download/v2.1.0/nuclei_2.1.0_linux_amd64.tar.gz
tar -xf nuclei_2.1.0_linux_amd64.tar.gz
mv nuclei /usr/bin/
rm nuclei_2.1.0_linux_amd64.tar.gz

git clone https://github.com/projectdiscovery/nuclei-templates.git
mv nuclei-templates /usr/share/

echo 'Installing wordlists'
cd /usr/share/
git clone https://github.com/3ndG4me/KaliLists.git wordlists

cd /root/
git clone https://github.com/DotNetRussell/Ensemble.git
cd Ensemble
nohup ./ensemble_agent --connection-string "{\"HOST\":\"$1\",\"PORT\":\"5680\",\"ENCRYPTION_KEY\":\"$2\"}" &

# don't worry, just ascii art ;-)
base64 -d <<< "ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9vb2Q+SCZIJlo/I00jYi1cLgogICAgICAgICAgICAgICAgICAgICAgICAuXEhNTU1NTVI/YFxNNmIuImAnICcnYGB2LgogICAgICAgICAgICAgICAgICAgICAuLiAuTU1NTU1NTU1NTUhNTU0jJi4gICAgICBgYH5vLgogICAgICAgICAgICAgICAgICAgLiAgICxITU1NTU1NTU1NTWAnICcgICAgICAgICAgID9NUD8uCiAgICAgICAgICAgICAgICAgIC4gfE1NTU1NTU1NTU1NJyAgICAgICAgICAgICAgICAgYCIkYiZcCiAgICAgICAgICAgICAgICAgLSAgfE1NTU1ISCMjTScgICAgICAgICAgICAgICAgICAgICBITU1IPwogICAgICAgICAgICAgICAgLSAgIFRUTXwgICAgID4uLiAgICAgICAgICAgICAgICAgICBcSE1NTU1ICiAgICAgICAgICAgICAgIDogICAgIHxNTVwsIy0iIiR+YlwuICAgICAgICAgICAgICAgIGBNTU1NTU0rCiAgICAgICAgICAgICAgLiAgICAgICBgYCJIJiMgICAgICAgIC0gICAgICAgICAgICAgICAmTU1NTU1NfAogICAgICAgICAgICAgIDogICAgICAgICAgICAqXHYsI01IZGRjLiAgICAgICAgICAgICAgYDlNTU1NTWIKICAgICAgICAgICAgICAuICAgICAgICAgICAgICAgTU1NTU1NTU0jI1wgICAgICAgICAgICAgYCIiOkhNCiAgICAgICAgICAgICAgLSAgICAgICAgICAuICAuSE1NTU1NTU1NTU1Sb18uICAgICAgICAgICAgICB8TQogICAgICAgICAgICAgIDogICAgICAgICAgICAgfE1NTU1NTU1NTU1NTU1NTU0jXCAgICAgICAgICAgOk0KICAgICAgICAgICAgICAtICAgICAgICAgICAgICBgSE1NTU1NTU1NTU1NTU1NJyAgICAgICAgICAgIHxUCiAgICAgICAgICAgICAgOiAgICAgICAgICAgICAgIGAqSE1NTU1NTU1NTU1NJyAgICAgICAgICAgICBIJwogICAgICAgICAgICAgICA6ICAgICAgICAgICAgICAgIE1NTU1NTU1NTU1NfCAgICAgICAgICAgICB8VAogICAgICAgICAgICAgICAgOyAgICAgICAgICAgICAgIE1NTU1NTU1NPycgICAgICAgICAgICAgIC4vCiAgICAgICAgICAgICAgICAgYCAgICAgICAgICAgICAgTU1NTU1NSCcgICAgICAgICAgICAgICAuLycKICAgICAgICAgICAgICAgICAgLSAgICAgICAgICAgIHxNTU1IIycgICAgICAgICAgICAgICAgIC4KICAgICAgICAgICAgICAgICAgIGAgICAgICAgICAgIGBNTSogICAgICAgICAgICAgICAgLiBgCiAgICAgICAgICAgICAgICAgICAgIF8gICAgICAgICAgI006IC4gICAgLiAgICAgICAuLScKICAgICAgICAgICAgICAgICAgICAgICAgLiAgICAgICAgICAuLCAgICAgICAgIC4tJwogICAgICAgICAgICAgICAgICAgICAgICAgICAnLS4tfm9vSEhfXywsdn4tLWAnCgogICAgX18gIF9fICAgICAgICAgICBfXyAgICAgIF9fICBfXyAgICAgICAgICAgIF9fX18gIF9fICAgICAgICAgICAgICAgICBfXwogICAvIC8gLyAvX19fIF9fX19fXy8gL19fICAgLyAvXy8gL18gIF9fXyAgICAgLyBfXyBcLyAvX19fIF9fX19fICBfX18gIC8gL18KICAvIC9fLyAvIF9fIGAvIF9fXy8gLy9fLyAgLyBfXy8gX18gXC8gXyBcICAgLyAvXy8gLyAvIF9fIGAvIF9fIFwvIF8gXC8gX18vCiAvIF9fICAvIC9fLyAvIC9fXy8gLDwgICAgLyAvXy8gLyAvIC8gIF9fLyAgLyBfX19fLyAvIC9fLyAvIC8gLyAvICBfXy8gL18KL18vIC9fL1xfXyxfL1xfX18vXy98X3wgICBcX18vXy8gL18vXF9fXy8gIC9fLyAgIC9fL1xfXyxfL18vIC9fL1xfX18vXF9fLwoK"
 
