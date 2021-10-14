Return-Path: <hugo.lhostis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC799C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:25:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.438.1634228757760054800
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Oct 2021 09:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A397811D4;
	Thu, 14 Oct 2021 09:25:56 -0700 (PDT)
Received: from e126543.cambridge.arm.com (unknown [10.1.195.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 349AA3F66F;
	Thu, 14 Oct 2021 09:25:56 -0700 (PDT)
From: Hugo L'Hostis <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/fvp-baser-aemv8r64.conf: Use virtio_net User
 Networking by default
Date: Thu, 14 Oct 2021 17:25:46 +0100
Message-Id: <20211014162546.35689-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Oct 2021 16:25:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2271

This patch adds config parameters to support virtio_net user networking b=
y
default fvp-baser-aemv8r64 and updates the documentation to remove the ol=
d
instructions about setting up tap networking.

Issue-Id: SCM-3536
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I4f3b74c5ba8b8e0b4205fca643a35affbe50a18c
---
 .../conf/machine/fvp-baser-aemv8r64.conf      |  1 +
 .../documentation/fvp-baser-aemv8r64.md       | 42 +++----------------
 2 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index b20bc58..2d63be5 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -57,4 +57,5 @@ FVP_CONFIG[gic_distributor.ITS-hardware-collection-coun=
t] ?=3D "1"
 FVP_CONFIG[gic_distributor.has-two-security-states] ?=3D "0"
 FVP_CONFIG[pctl.startup] ?=3D "0.0.0.*"
 FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
 FVP_CONFIG[bp.vis.rate_limit-enable] ?=3D "0"
\ No newline at end of file
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index ef68fe4..0c801c0 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -99,44 +99,13 @@ Building with the Real-Time Linux kernel (PREEMPT\_RT=
):
     export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml
=20
-### Networking
-To enable networking on the FVP via a host network interface, you will n=
eed to
-install the following package(s):
-
-**Ubuntu 18.04:**
-
-    sudo apt-get install libvirt-bin net-tools
-
-**Ubuntu 20.04:**
-
-    sudo apt-get install libvirt-dev libvirt-daemon qemu-kvm libvirt-dae=
mon-system libvirt-clients bridge-utils net-tools
-
-Once that is installed for your OS version, setup tap0 using the followi=
ng
-commands:
-
-    sudo virsh net-start default
-    sudo ip tuntap add dev tap0 mode tap user $(whoami)
-    sudo ifconfig tap0 0.0.0.0 promisc up
-    sudo brctl addif virbr0 tap0
-
-To clean up the tap0 interface on the host use the following commands:
-
-    sudo brctl delif virbr0 tap0
-    sudo ip link set virbr0 down
-    sudo brctl delbr virbr0
-    sudo virsh net-destroy default
-    sudo ip link delete tap0
-
 ### Run
 To run an image after the build is done with the standard Linux kernel:
=20
     kas shell --keep-config-unchanged \
        meta-arm/kas/fvp-baser-aemv8r64-bsp.yml \
            --command "../layers/meta-arm/scripts/runfvp \
-                --console \
-                -- \
-                    --parameter 'bp.smsc_91c111.enabled=3D1' \
-                    --parameter 'bp.virtio_net.hostbridge.interfaceName=3D=
tap0'"
+           --console "
=20
 To run an image after the build is done with the Real-Time Linux kernel
 (PREEMPT\_RT):
@@ -144,10 +113,7 @@ To run an image after the build is done with the Rea=
l-Time Linux kernel
     kas shell --keep-config-unchanged \
        meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml \
            --command "../layers/meta-arm/scripts/runfvp \
-                --console \
-                -- \
-                    --parameter 'bp.smsc_91c111.enabled=3D1' \
-                    --parameter 'bp.virtio_net.hostbridge.interfaceName=3D=
tap0'"
+           --console "
=20
 **Note:** The terminal console login is `root` without password.
=20
@@ -200,8 +166,10 @@ Known Issues and Limitations
 Change Log
 ----------
=20
+- Added virtio_net User Networking mode by default and removed instructi=
ons
+  about tap networking setup.
 - Updated Linux kernel version from 5.10 to 5.14 for both standard and
-Real-Time (PREEMPT\_RT) builds.
+  Real-Time (PREEMPT\_RT) builds.
 - Enabled SMP support via boot-wrapper-aarch64 providing the PSCI CPU_ON=
 and
   CPU_OFF functions.
 - Introduced Armv8-R64 compiler flags.
--=20
2.25.1


