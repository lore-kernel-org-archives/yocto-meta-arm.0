Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF43C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:50:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.46697.1699005020459876583
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 02:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD0B92F4
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Nov 2023 02:51:02 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.2.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B21EA3F64C
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Nov 2023 02:50:19 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] kas: Add kas configuration for Arm SystemReady and fvp-base
Date: Fri,  3 Nov 2023 09:49:38 +0000
Message-Id: <20231103094939.1290558-4-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231103094939.1290558-1-Debbie.Martin@arm.com>
References: <20231103094939.1290558-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Nov 2023 09:50:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5201

Add systemready firmware, systemready ACS, systemready distros, and
fvp-base kas configurations. Update the README file with
instructions on how to build and run using them.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 kas/arm-systemready-firmware.yml              | 12 ++++++
 kas/arm-systemready-ir-acs.yml                | 17 ++++++++
 kas/arm-systemready-linux-distros-debian.yml  |  7 +++
 ...arm-systemready-linux-distros-opensuse.yml |  7 +++
 kas/fvp-base.yml                              | 43 +++++++++++++++++++
 meta-arm-systemready/README.md                | 22 ++++++++++
 6 files changed, 108 insertions(+)
 create mode 100644 kas/arm-systemready-firmware.yml
 create mode 100644 kas/arm-systemready-ir-acs.yml
 create mode 100644 kas/arm-systemready-linux-distros-debian.yml
 create mode 100644 kas/arm-systemready-linux-distros-opensuse.yml
 create mode 100644 kas/fvp-base.yml

diff --git a/kas/arm-systemready-firmware.yml b/kas/arm-systemready-firmw=
are.yml
new file mode 100644
index 00000000..8b0b9fd5
--- /dev/null
+++ b/kas/arm-systemready-firmware.yml
@@ -0,0 +1,12 @@
+header:
+  version: 13
+
+repos:
+  meta-arm:
+    layers:
+      meta-arm-systemready:
+
+distro: nodistro
+
+target:
+  - arm-systemready-firmware
diff --git a/kas/arm-systemready-ir-acs.yml b/kas/arm-systemready-ir-acs.=
yml
new file mode 100644
index 00000000..38604d7f
--- /dev/null
+++ b/kas/arm-systemready-ir-acs.yml
@@ -0,0 +1,17 @@
+header:
+  version: 13
+  includes:
+    - kas/arm-systemready-firmware.yml
+
+env:
+  TESTIMAGE_AUTO: "1"
+  # The full testimage run typically takes around 12-24h on fvp-base.
+  TEST_OVERALL_TIMEOUT: "${@ 24*60*60}"
+
+local_conf_header:
+  systemready-ir-acs: |
+    IMAGE_CLASSES:append =3D " testimage"
+
+
+target:
+  - arm-systemready-ir-acs
diff --git a/kas/arm-systemready-linux-distros-debian.yml b/kas/arm-syste=
mready-linux-distros-debian.yml
new file mode 100644
index 00000000..38cc74b2
--- /dev/null
+++ b/kas/arm-systemready-linux-distros-debian.yml
@@ -0,0 +1,7 @@
+header:
+  version: 13
+  includes:
+    - kas/arm-systemready-firmware.yml
+
+target:
+  - arm-systemready-linux-distros-debian
diff --git a/kas/arm-systemready-linux-distros-opensuse.yml b/kas/arm-sys=
temready-linux-distros-opensuse.yml
new file mode 100644
index 00000000..cffbdb92
--- /dev/null
+++ b/kas/arm-systemready-linux-distros-opensuse.yml
@@ -0,0 +1,7 @@
+header:
+  version: 13
+  includes:
+    - kas/arm-systemready-firmware.yml
+
+target:
+  - arm-systemready-linux-distros-opensuse
diff --git a/kas/fvp-base.yml b/kas/fvp-base.yml
new file mode 100644
index 00000000..18b9134b
--- /dev/null
+++ b/kas/fvp-base.yml
@@ -0,0 +1,43 @@
+header:
+  version: 13
+  includes:
+    - kas/fvp-eula.yml
+
+env:
+  DISPLAY:
+  WAYLAND_DISPLAY:
+  XAUTHORITY:
+
+
+distro: poky
+machine: fvp-base
+
+defaults:
+  repos:
+    refspec: master
+
+repos:
+  meta-arm:
+    layers:
+      meta-arm:
+      meta-arm-bsp:
+      meta-arm-toolchain:
+
+  poky:
+    url: https://git.yoctoproject.org/git/poky
+    path: layers/poky
+    layers:
+      meta:
+      meta-poky:
+
+local_conf_header:
+  base: |
+    CONF_VERSION =3D "2"
+    PACKAGE_CLASSES =3D "package_ipk"
+    PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
+    EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks ssh-server-openssh"
+    CORE_IMAGE_EXTRA_INSTALL:append =3D " ssh-pregen-hostkeys"
+    IMAGE_CLASSES:append =3D " testimage fvpboot"
+
+target:
+  - core-image-minimal
diff --git a/meta-arm-systemready/README.md b/meta-arm-systemready/README=
.md
index ed0da1bf..49cfed6e 100644
--- a/meta-arm-systemready/README.md
+++ b/meta-arm-systemready/README.md
@@ -78,6 +78,28 @@ Currently, this layer only supports
 [Arm SystemReady IR ACS version v23.03_2.0.0][], which is verified on th=
e
 [`fvp-base`][] machine.
=20
+## Build and Run
+
+To build the firmware for Arm SystemReady on the supported machines (tak=
e the
+`fvp-base` machine as an example):
+
+    kas build kas/fvp-base.yml:kas/arm-systemready-firmware.yml
+
+
+To run the Arm SystemReady ACS tests on the supported machines (take run=
ning
+Arm SystemReady IR on the `fvp-base` machine as an example):
+
+    kas build kas/fvp-base.yml:kas/arm-systemready-ir-acs.yml
+
+To run the Linux distributions installation on the supported machines (t=
ake
+installing openSUSE on the `fvp-base` machine as an example):
+
+    kas build kas/fvp-base.yml:kas/arm-systemready-linux-distros-opensus=
e.yml
+
+    kas shell \
+        kas/fvp-base.yml:kas/arm-systemready-linux-distros-opensuse.yml =
\
+        -c "../scripts/runfvp --verbose --console"
+
 ## Guidelines for Reusing and Extending
=20
 Currently, this layer only supports the Arm SystemReady IR band running =
on the
--=20
2.25.1


