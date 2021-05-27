Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7441.1622125796860867305
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 May 2021 07:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DE7811D4;
	Thu, 27 May 2021 07:29:56 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.39.140])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C75F43F73D;
	Thu, 27 May 2021 07:29:55 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Filipe Rinaldi <filipe.rinaldi@arm.com>
Subject: [PATCH hardknott 1/2] arm-bsp/docs: Updated documentation fvp-baser-aemv8r64 MACHINE
Date: Thu, 27 May 2021 15:29:46 +0100
Message-Id: <20210527142947.184781-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Filipe Rinaldi <filipe.rinaldi@arm.com>

This update has mainly format related changes (no functional changes) to
improve readability when reading the non-rendered version of it.
- Use underlined style for headers level 1 and 2
- Use indentation to create blocks
- Use double space at the end of each section
- Add indentation to the FVP parameters
- Add pip command to install the kas tool

Issue-Id: SCM-2665
Signed-off-by: Filipe Rinaldi <filipe.rinaldi@arm.com>
Change-Id: I9d4b4dbcef6dc13638b62563ebdf90b6b9d5b686
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../documentation/fvp-baser-aemv8r64.md       | 160 ++++++++++--------
 1 file changed, 89 insertions(+), 71 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 18a01af..5034de1 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -1,6 +1,9 @@
-# Armv8-R AArch64 AEM FVP Support in meta-arm-bsp
+Armv8-R AArch64 AEM FVP Support in meta-arm-bsp
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Overview
+--------
=20
-## Overview
 Fixed Virtual Platforms (FVP) are complete simulations of an Arm system,
 including processor, memory and peripherals. These are set out in a
 "programmer's view", which gives you a comprehensive model on which to b=
uild
@@ -16,34 +19,43 @@ https://developer.arm.com/ip-products/processors/cort=
ex-r/cortex-r82
 Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
 https://developer.arm.com/docs/100966/latest
=20
-## BSP Support
+
+BSP Support
+-----------
 The fvp-baser-aemv8r64 Yocto MACHINE supports the following BSP componen=
ts:
=20
  - boot-wrapper-aarch64
  - Kernel: linux-yocto-5.10
=20
-## Quick start: Howto Build and Run
+
+Quick start: Howto Build and Run
+--------------------------------
=20
 ### Host environment setup
-Install the Required Packages for the Build Host:
+Install the required packages for the build host:
 https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#re=
quired-packages-for-the-build-host
=20
 Install the kas setup tool for bitbake based projects:
-https://kas.readthedocs.io/en/latest/userguide.html#dependencies-install=
ation
+
+    pip3 install --user kas
+
+For more details on kas, see https://kas.readthedocs.io/.
+
=20
 ### Fetch sources
-Fetch meta-arm repository:
-```
-mkdir -p ~/fvp-baser-aemv8r64-bsp
-cd ~/fvp-baser-aemv8r64-bsp
-git clone https://git.yoctoproject.org/git/meta-arm
-```
+Fetch the meta-arm repository into a build directory:
+
+    mkdir -p ~/fvp-baser-aemv8r64-build
+    cd ~/fvp-baser-aemv8r64-build
+    git clone https://git.yoctoproject.org/git/meta-arm
+
=20
 ### Build
-```
-cd ~/fvp-baser-aemv8r64-bsp
-kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
-```
+Building with the standard Linux kernel:
+
+    cd ~/fvp-baser-aemv8r64-build
+    kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
+
=20
 ### Run
 To Run the Fixed Virtual Platform simulation tool you must download "Arm=
v8-R
@@ -53,71 +65,77 @@ https://developer.arm.com/tools-and-software/simulati=
on-models/fixed-virtual-pla
 and install it on your host PC.
=20
 To run an image after the build is done:
-```
-export YOCTO_DEPLOY_IMGS_DIR=3D"~/fvp-baser-aemv8r64-bsp/build/tmp/deplo=
y/images/fvp-baser-aemv8r64/"
-cd <path-to-AEMv8R_base_pkg>/models/Linux64_GCC-6.4/
-./FVP_BaseR_AEMv8R \
--C bp.dram_metadata.init_value=3D0 \
--C bp.dram_metadata.is_enabled=3Dtrue \
--C bp.dram_size=3D8 \
--C bp.exclusive_monitor.monitor_access_level=3D1 \
--C bp.pl011_uart0.unbuffered_output=3D1 \
--C bp.pl011_uart0.untimed_fifos=3Dtrue \
--C bp.refcounter.non_arch_start_at_default=3D1 \
--C bp.smsc_91c111.enabled=3D0 \
--C bp.ve_sysregs.mmbSiteDefault=3D0 \
--C cache_state_modelled=3Dtrue \
--C cluster0.gicv3.cpuintf-mmap-access-level=3D2 \
--C cluster0.gicv3.SRE-enable-action-on-mmap=3D2 \
--C cluster0.gicv3.SRE-EL2-enable-RAO=3D1 \
--C cluster0.gicv3.extended-interrupt-range-support=3D1 \
--C cluster0.has_aarch64=3D1 \
--C cluster0.NUM_CORES=3D4 \
--C cluster0.stage12_tlb_size=3D512 \
--C gic_distributor.GICD_CTLR-DS-1-means-secure-only=3D1 \
--C gic_distributor.GITS_BASER0-type=3D1 \
--C gic_distributor.ITS-count=3D1 \
--C gic_distributor.ITS-hardware-collection-count=3D1 \
--C gic_distributor.direct-lpi-support=3D1 \
--C gic_distributor.has-two-security-states=3D0 \
--C pctl.startup=3D0.0.0.* \
--C bp.virtio_net.enabled=3D1 \
--C cache_state_modelled=3D0 \
--C bp.vis.rate_limit-enable=3D0 \
--C bp.virtio_net.hostbridge.interfaceName=3Dtap0 \
--a cluster0*=3D${YOCTO_DEPLOY_IMGS_DIR}/linux-system.axf \
--C bp.virtioblockdevice.image_path=3D${YOCTO_DEPLOY_IMGS_DIR}/core-image=
-minimal-fvp-baser-aemv8r64.wic
-```
-
-The terminal console login is `root` without password.
-
-## Devices supported in the kernel
+
+    export YOCTO_DEPLOY_IMGS_DIR=3D"~/fvp-baser-aemv8r64-bsp/build/tmp/d=
eploy/images/fvp-baser-aemv8r64/"
+    cd <path-to-AEMv8R_base_pkg>/models/Linux64_GCC-6.4/
+    ./FVP_BaseR_AEMv8R \
+        -C bp.dram_metadata.init_value=3D0 \
+        -C bp.dram_metadata.is_enabled=3Dtrue \
+        -C bp.dram_size=3D8 \
+        -C bp.exclusive_monitor.monitor_access_level=3D1 \
+        -C bp.pl011_uart0.unbuffered_output=3D1 \
+        -C bp.pl011_uart0.untimed_fifos=3Dtrue \
+        -C bp.refcounter.non_arch_start_at_default=3D1 \
+        -C bp.smsc_91c111.enabled=3D0 \
+        -C bp.ve_sysregs.mmbSiteDefault=3D0 \
+        -C cache_state_modelled=3Dtrue \
+        -C cluster0.gicv3.cpuintf-mmap-access-level=3D2 \
+        -C cluster0.gicv3.SRE-enable-action-on-mmap=3D2 \
+        -C cluster0.gicv3.SRE-EL2-enable-RAO=3D1 \
+        -C cluster0.gicv3.extended-interrupt-range-support=3D1 \
+        -C cluster0.has_aarch64=3D1 \
+        -C cluster0.NUM_CORES=3D4 \
+        -C cluster0.stage12_tlb_size=3D512 \
+        -C gic_distributor.GICD_CTLR-DS-1-means-secure-only=3D1 \
+        -C gic_distributor.GITS_BASER0-type=3D1 \
+        -C gic_distributor.ITS-count=3D1 \
+        -C gic_distributor.ITS-hardware-collection-count=3D1 \
+        -C gic_distributor.direct-lpi-support=3D1 \
+        -C gic_distributor.has-two-security-states=3D0 \
+        -C pctl.startup=3D0.0.0.* \
+        -C bp.virtio_net.enabled=3D1 \
+        -C cache_state_modelled=3D0 \
+        -C bp.vis.rate_limit-enable=3D0 \
+        -C bp.virtio_net.hostbridge.interfaceName=3Dtap0 \
+        -a cluster0*=3D${YOCTO_DEPLOY_IMGS_DIR}/linux-system.axf \
+        -C bp.virtioblockdevice.image_path=3D${YOCTO_DEPLOY_IMGS_DIR}/co=
re-image-minimal-fvp-baser-aemv8r64.wic
+
+**Note:** The terminal console login is `root` without password.
+
+
+Devices supported in the kernel
+-------------------------------
+
 - serial
 - virtio disk
 - virtio network
 - watchdog
 - rtc
=20
-## Devices not supported or not functional
+
+Devices not supported or not functional
+---------------------------------------
+
 - Only one CPU since SMP is not functional in boot-wrapper-aarch64 yet
=20
-## Networking
+
+Networking
+----------
=20
 To enable networking on the FVP via a host network interface, set up tap=
0 using
 the following commands (Ubuntu 18.04 Host):
-```
-sudo apt-get install libvirt-bin
-sudo virsh net-start default
-sudo ip tuntap add dev tap0 mode tap user $(whoami)
-sudo ifconfig tap0 0.0.0.0 promisc up
-sudo brctl addif virbr0 tap0
-```
+
+    sudo apt-get install libvirt-bin
+    sudo virsh net-start default
+    sudo ip tuntap add dev tap0 mode tap user $(whoami)
+    sudo ifconfig tap0 0.0.0.0 promisc up
+    sudo brctl addif virbr0 tap0
+
=20
 To clean up the tap0 interface on the host use the following commands:
-```
-sudo brctl delif virbr0 tap0
-sudo ip link set virbr0 down
-sudo brctl delbr virbr0
-sudo virsh net-destroy default
-sudo ip link delete tap0
-```
+
+    sudo brctl delif virbr0 tap0
+    sudo ip link set virbr0 down
+    sudo brctl delbr virbr0
+    sudo virsh net-destroy default
+    sudo ip link delete tap0
--=20
2.25.1

