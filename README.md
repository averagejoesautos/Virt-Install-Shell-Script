# Virt-Install-Shell-Script
A Bash script which simplifies using virt-install to create new virtual machines (VMs) without a GUI.

<h2><b>Concept:</h2></b>
The idea came about while thinking through the most efficient way of setting up a lab environment for my Redhat RHCE8 studies. I run a headless Ubuntu home server so virt-manger or any other GUI option was out of the running.

<h2><b>Use Cases:</h2></b>
<ul>
  <li>VM Lab set up for IT studies utilizing a Linux environment.</li>
  <li>VM creation for those with headless Unix/Linux servers with a need to deploy VMs in a easy repeatable way.</li>
  <li>Lazy sys admins utilizing a small environment who hate stringing together long commands with fat finger errors <b>[GUILTY as charged]</b></li>
</ul>

<h2><b>Requirements:</h2></b>
<ul>
  <li>Unix/Linux server.  Obviously, you will have to take into account your boxs hardware and cpu, but I'd recommend at <b><u>MININMUM a 4 core CPU capabale of virtualization, a minimum of 8GB RAM, and atleast space for the VM disks you create.</b></u></li>
  <li><b>Virt-install</b> MUST be installed on your system to utilize this script as it is built around this command.  In that regard, your system must be configured for KVM virtualization which is typically handled by the <b>libvertd</b> daemon.  If you are unsure if libvertd is installed already you can run the command <b>"systemctl status libvertd"</b> and if it is installed you will see the status of the daemon.  If it's not, Google you flavor of Linux and how to install Libvert and follow that tutorial to get it installed on your box.  Once installed, apt/yum/dnf search virt-install and install it (if not arleady installed during the previos install of libvertd).</li>
  <li> VNC viewer of your choice.  I utilize Remmina but tightvnc [which will install vncviewer] will also work.  Just apt/yum/dnf vnc and see what's in your repos and install a viewer of your choosing.  You will need to utilize VNC after the script runs to complete the rest of the VM creation on a client of your choosing.  In my case, I use my admin laptop which already has Reminna installed.  The beuaty of this method is, you get a graphical interface in a headless environment via VNC.  More on this in the "Steps" section</li>
  <li><b>**OPTIONAL**</b> Not required, but your host server should have atleast two NIC's if you want to bridge your VM's to appear on your network.  If only one NIC is used, you will be forced to use the default network which is NAT only.  Plenty of good write ups on how to create a bridge, which is out of scope as it pertains to this program.</b></u></li>
</ul>
<h2><b>Instructions:</h2></b>
The program is pretty self explanitory as each prompt asks you for specific parameters to configure your VM with.  I'm a fan of visual instructions so rather then bore you with step-by-step written instruction, I've created a video walk through of the script in action.  Please check the video walk through below via my youtube channel:<br>

<br><center><font size="+2"><href>https://youtu.be/aJ1a6qyl6Rg</href></center></font><br>

<br><h1><b>Enhancements:</h1></b>
By no means does this script encompass ALL of the features, options, and scenerios when launching a KVM VM using virt-install.  This is just a basic "Rip-N-Ship" deploy schema to get machines deployed fast and ready to use.  Feel free to customize the script to meed YOUR needs and enviroment.<br>

<br>Cheers,<br>
<br>Yusef
