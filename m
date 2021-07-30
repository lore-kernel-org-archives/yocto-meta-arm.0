Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.24854.1627656684773819282
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 07:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFE371063;
	Fri, 30 Jul 2021 07:51:23 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.9.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF44B3F66F;
	Fri, 30 Jul 2021 07:51:22 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/fvp-baser-aemv8r64: add support for virtio-9p
Date: Fri, 30 Jul 2021 15:51:13 +0100
Message-Id: <20210730145113.774787-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds a device tree entry and kernel configs to enable file
sharing between the host and the FVP using the virtio P9 device
component.

Issue-Id: SCM-2299
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Icd757e3c6281e5e84985a3caac72e860a4aeee7f
---
 .../documentation/fvp-baser-aemv8r64.md        | 18 ++++++++++++++++++
 .../bsp/arm-platforms/fvp-baser-aemv8r64.scc   |  1 +
 .../bsp/arm-platforms/virtio-9p.cfg            |  4 ++++
 .../bsp/arm-platforms/virtio-9p.scc            |  1 +
 .../fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts  |  6 ++++++
 5 files changed, 30 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/virtio-9p.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/virtio-9p.scc

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 53fdca7..166969c 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -152,10 +152,28 @@ runfvp script:
=20
  - Type ``ctrl+c`` and wait for kas process to finish.
=20
+### File sharing between host and fvp
+It is possible to share a directory between the host machine and the fvp=
 using
+the virtio P9 device component included in the kernel. To do so, create =
a
+directory to be mounted from the host machine:
+
+    mkdir /path/to/host-mount-dir
+
+Then, add the following parameter containing the path to the directory w=
hen
+launching the model:
+
+    --parameter 'bp.virtiop9device.root_path=3D/path/to/host-mount-dir'
+
+Once you are logged into the fvp, the host directory can be mounted in a
+directory on the model using the following command:
+
+    mount -t 9p -o trans=3Dvirtio,version=3D9p2000.L FM /path/to/fvp-mou=
nt-dir
+
 Devices supported in the kernel
 -------------------------------
=20
 - serial
+- virtio 9p
 - virtio disk
 - virtio network
 - watchdog
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-baser-aemv8r64.scc b/meta-arm-bsp/recipes-kernel/linux/ar=
m-platforms-kmeta/bsp/arm-platforms/fvp-baser-aemv8r64.scc
index accf146..a8d7967 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-baser-aemv8r64.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-baser-aemv8r64.scc
@@ -1,3 +1,4 @@
 kconf hardware arm64.cfg
 kconf hardware fvp-common-peripherals.cfg
 include cfg/virtio.scc
+include virtio-9p.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/virtio-9p.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platfor=
ms-kmeta/bsp/arm-platforms/virtio-9p.cfg
new file mode 100644
index 0000000..c9fefa1
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/virtio-9p.cfg
@@ -0,0 +1,4 @@
+CONFIG_NET_9P=3Dy
+CONFIG_NET_9P_VIRTIO=3Dy
+CONFIG_9P_FS=3Dy
+CONFIG_9P_FS_POSIX_ACL=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/virtio-9p.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platfor=
ms-kmeta/bsp/arm-platforms/virtio-9p.scc
new file mode 100644
index 0000000..33c0465
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/virtio-9p.scc
@@ -0,0 +1 @@
+kconf non-hardware virtio-9p.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/f=
vp-baser-aemv8r64.dts b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser=
-aemv8r64/fvp-baser-aemv8r64.dts
index 3e552f8..dfc6f7e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
@@ -163,6 +163,12 @@
                 interrupts =3D <0x0 42 0x4>;
         };
=20
+        virtio-p9@9c140000{
+                compatible =3D "virtio,mmio";
+                reg =3D <0x0 0x9c140000 0x0 0x1000>;
+                interrupts =3D <0x0 43 0x4>;
+        };
+
         virtio-net@9c150000 {
                 compatible =3D "virtio,mmio";
                 reg =3D <0 0x9c150000 0 0x200>;
--=20
2.25.1

