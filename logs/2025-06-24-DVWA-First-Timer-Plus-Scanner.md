DATE: 2025-06-24
Subject: DVWA Installation & Beacon Scanning
Description:

Today, I worked on installing DVWA (Damn Vulnerable Web Application) safely in a non-public-facing environment using a Raspberry Pi. I also built a Python script to detect basic beaconing behavior with help from ChatGPT and Python documentation.


Technical Overview:

    Preventing DVWA Exposure via IPv6:
    The Raspberry Pi was receiving a global IPv6 address via DHCP. Without hardening, this could make DVWA externally accessible.

    Mitigation Steps:

    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1  
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

    Localhost-Only Web Server Binding:
    After installing Apache, MariaDB, and PHP, I installed ufw and modified it to only allow incoming connections from my IP specifically, and all outbound connections. Everything else was blocked. Ontop of that, I made changes to the configs for Apache. Originally, I set it to 127.0.0.1:80 to listen locally, but realized that it wouldn't interact with systems outside of the Pi, so I changed it to 0.0.0.0:80.
    Changes were made in:

        /etc/apache2/ports.conf

        /etc/apache2/sites-available/000-default.conf

    Beacon Detection Script:
    Created a Python script (Beacon_Scan.py) to identify potential beaconing by analyzing packet capture timing. It separates traffic by inbound/outbound direction and flags patterns of regular interval connections.

Ethical Note:

    Everything was done on my own hardware in a closed network.

    Payloads and scripts were verified to not send data externally.

    Ethics remain a high priority — especially regarding public exposure of test environments.

What I Actually Learned:

    IPv6 Can Be a Liability:
    Devices connected to most networks will receive a global IPv6 address unless you explicitly disable it. Combined with default Apache settings, this can make a local vulnerable app (like DVWA) public unintentionally.

    Apache Hardening Basics:
    Learned to isolate Apache to localhost and where to configure that setting.

    Network Scripting in Python:
    The beacon script was AI-assisted but the logic is mine, and I also made sure to mainly use it for structure and debugging. I used scapy and built logic to track timestamps and connection regularity. A great hands-on start to passive network analysis, in my opinion, that isn't premade tools like wireshark.

    SSH Key Mismatch Lessons:
    I had ~14 host keys built up from reflashing the Pi, reconnecting, accidentally forgetting passwords, and so on. Fixed the SSH conflict by clearing out old keys from ~/.ssh/known_hosts, not wiping the system.

    Comfort With Command-Line Tools:
    Became more confident reading man pages, using nano for config edits, and chaining install commands for multiple packages.

Next Steps:

    Persistently disable IPv6 in /etc/sysctl.conf instead of doing it on a per-session basis.

    Expand the beaconing scanner to include anomaly thresholds or detection scoring
