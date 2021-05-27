Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7435.1622125276864866838
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 May 2021 07:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A95811D4;
	Thu, 27 May 2021 07:21:15 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.39.140])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB8B3F73D;
	Thu, 27 May 2021 07:21:14 -0700 (PDT)
From: hugo.lhostis@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/docs: documentation improvements for fvp-baser-aemv8r64
Date: Thu, 27 May 2021 15:21:03 +0100
Message-Id: <20210527142103.180552-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch updates the documentation for fvp-baser-aemv8r64 :

- Update link to the yocto documentation.
- Add details about what Host OS version are supported. Add Ubuntu
20.04 specific instructions.
- Warn user about disk space.

Issue-Id: SCM-2665
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Ie93a42c2a1ec595707fa7496edbf024650f7eb85
---
 .../documentation/fvp-baser-aemv8r64.md       | 55 +++++++++++--------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index c091f15..fc56def 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -39,8 +39,10 @@ Quick start: Howto Build and Run
 --------------------------------
=20
 ### Host environment setup
+The following instructions have been tested on hosts running Ubuntu 18.0=
4 and
+Ubuntu 20.04.
 Install the required packages for the build host:
-https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#re=
quired-packages-for-the-build-host
+https://docs.yoctoproject.org/singleindex.html#required-packages-for-the=
-build-host
=20
 Install the kas setup tool for bitbake based projects:
=20
@@ -48,6 +50,8 @@ Install the kas setup tool for bitbake based projects:
=20
 For more details on kas, see https://kas.readthedocs.io/.
=20
+**Note:** The host machine should have at least 50 GBytes of free disk s=
pace
+for the next steps to work correctly.
=20
 ### Fetch sources
 Fetch the meta-arm repository into a build directory:
@@ -68,6 +72,33 @@ Building with the Real-Time Linux kernel (PREEMPT\_RT)=
:
     cd ~/fvp-baser-aemv8r64-build
     kas build meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml
=20
+### Networking
+To enable networking on the FVP via a host network interface, you will n=
eed to
+install the following package(s):
+
+**Ubuntu 18.04:**
+
+    sudo apt-get install libvirt-bin
+
+**Ubuntu 20.04:**
+
+    sudo apt-get install libvirt-dev libvirt-daemon qemu-kvm libvirt-dae=
mon-system libvirt-clients bridge-utils
+
+Once that is installed for your OS version, setup tap0 using the followi=
ng
+commands:
+
+    sudo virsh net-start default
+    sudo ip tuntap add dev tap0 mode tap user $(whoami)
+    sudo ifconfig tap0 0.0.0.0 promisc up
+    sudo brctl addif virbr0 tap0
+
+To clean up the tap0 interface on the host use the following commands:
+
+    sudo brctl delif virbr0 tap0
+    sudo ip link set virbr0 down
+    sudo brctl delbr virbr0
+    sudo virsh net-destroy default
+    sudo ip link delete tap0
=20
 ### Run
 To Run the Fixed Virtual Platform simulation tool you must download "Arm=
v8-R
@@ -102,7 +133,6 @@ To run an image after the build is done:
         -C gic_distributor.GITS_BASER0-type=3D1 \
         -C gic_distributor.ITS-count=3D1 \
         -C gic_distributor.ITS-hardware-collection-count=3D1 \
-        -C gic_distributor.direct-lpi-support=3D1 \
         -C gic_distributor.has-two-security-states=3D0 \
         -C pctl.startup=3D0.0.0.* \
         -C bp.virtio_net.enabled=3D1 \
@@ -130,24 +160,3 @@ Devices not supported or not functional
=20
 - Only one CPU since SMP is not functional in boot-wrapper-aarch64 yet
=20
-
-Networking
-----------
-
-To enable networking on the FVP via a host network interface, set up tap=
0 using
-the following commands (Ubuntu 18.04 Host):
-
-    sudo apt-get install libvirt-bin
-    sudo virsh net-start default
-    sudo ip tuntap add dev tap0 mode tap user $(whoami)
-    sudo ifconfig tap0 0.0.0.0 promisc up
-    sudo brctl addif virbr0 tap0
-
-
-To clean up the tap0 interface on the host use the following commands:
-
-    sudo brctl delif virbr0 tap0
-    sudo ip link set virbr0 down
-    sudo brctl delbr virbr0
-    sudo virsh net-destroy default
-    sudo ip link delete tap0
--=20
2.25.1

