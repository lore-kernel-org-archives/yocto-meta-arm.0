Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23419.1629723626173311744
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Aug 2021 06:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D391D1042;
	Mon, 23 Aug 2021 06:00:25 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.90.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 071933F5A1;
	Mon, 23 Aug 2021 06:00:24 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/3] arm-bsp/docs: fvp-baser-aemv8r64 readme updates
Date: Mon, 23 Aug 2021 14:00:09 +0100
Message-Id: <20210823130009.189450-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823130009.189450-1-peter.hoyes@arm.com>
References: <20210823130009.189450-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

 * Add missing net-tools to apt-get install list
 * Use export to set FVP_BASE_R_AEM_TARBALL_URI and
   FVP_BASE_R_AEM_EULA_ACCEPT and make kas build its own command.
 * Change bp.hostbridge.interfaceName=3Dtap0 to
   bp.virtio_net.hostbridge.interfaceName=3Dta0 for runfvp, so that the
   FVP can access the external network.

Issue-Id: SCM-2987
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: If9052400d2ae199861bc00ce119d28069f476f7e
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 6a76a64..c2db101 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -81,15 +81,15 @@ Fetch the meta-arm repository into a build directory:
 Building with the standard Linux kernel:
=20
     cd ~/fvp-baser-aemv8r64-build
-    FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Base_AEMv=
8R_11.15_14.tgz" \
-    FVP_BASE_R_ARM_EULA_ACCEPT=3D"True" \
+    export FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Ba=
se_AEMv8R_11.15_14.tgz"
+    export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
=20
 Building with the Real-Time Linux kernel (PREEMPT\_RT):
=20
     cd ~/fvp-baser-aemv8r64-build
-    FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Base_AEMv=
8R_11.15_14.tgz" \
-    FVP_BASE_R_ARM_EULA_ACCEPT=3D"True" \
+    export FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Ba=
se_AEMv8R_11.15_14.tgz"
+    export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml
=20
 ### Networking
@@ -98,11 +98,11 @@ install the following package(s):
=20
 **Ubuntu 18.04:**
=20
-    sudo apt-get install libvirt-bin
+    sudo apt-get install libvirt-bin net-tools
=20
 **Ubuntu 20.04:**
=20
-    sudo apt-get install libvirt-dev libvirt-daemon qemu-kvm libvirt-dae=
mon-system libvirt-clients bridge-utils
+    sudo apt-get install libvirt-dev libvirt-daemon qemu-kvm libvirt-dae=
mon-system libvirt-clients bridge-utils net-tools
=20
 Once that is installed for your OS version, setup tap0 using the followi=
ng
 commands:
@@ -129,7 +129,7 @@ To run an image after the build is done with the stan=
dard Linux kernel:
                 --console \
                 -- \
                     --parameter 'bp.smsc_91c111.enabled=3D1' \
-                    --parameter 'bp.hostbridge.interfaceName=3Dtap0'"
+                    --parameter 'bp.virtio_net.hostbridge.interfaceName=3D=
tap0'"
=20
 To run an image after the build is done with the Real-Time Linux kernel
 (PREEMPT\_RT):
@@ -140,7 +140,7 @@ To run an image after the build is done with the Real=
-Time Linux kernel
                 --console \
                 -- \
                     --parameter 'bp.smsc_91c111.enabled=3D1' \
-                    --parameter 'bp.hostbridge.interfaceName=3Dtap0'"
+                    --parameter 'bp.virtio_net.hostbridge.interfaceName=3D=
tap0'"
=20
 **Note:** The terminal console login is `root` without password.
=20
--=20
2.25.1

