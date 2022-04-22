Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7916AC63686
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10532.1650643778517566901
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 133561FB;
	Fri, 22 Apr 2022 09:09:38 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.95.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FC443F5A1;
	Fri, 22 Apr 2022 09:09:37 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/6] ci,arm-bsp/conf: Add testimage for fvp-baser-aemv8r64
Date: Fri, 22 Apr 2022 17:08:56 +0100
Message-Id: <20220422160900.1861031-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422160900.1861031-1-peter.hoyes@arm.com>
References: <20220422160900.1861031-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3287

From: Peter Hoyes <Peter.Hoyes@arm.com>

Add test configuration to machine config. Add testimage to Kas file, so
that testimage works out of the box.

Issue-Id: SCM-4304
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I27dc9760a2c58f43ea557efdc97d363b0d3c1447
---
 .gitlab-ci.yml                                    | 5 +++++
 kas/fvp-baser-aemv8r64-bsp.yml                    | 1 +
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 6 ++++++
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md  | 1 +
 4 files changed, 13 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bd1ae59..04d8754 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -108,6 +108,11 @@ fvp-base-arm32:
=20
 fvp-baser-aemv8r64:
   extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
+  tags:
+    - x86_64
=20
 fvps:
   extends: .build
diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index 43ca36a..0958c9b 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -34,6 +34,7 @@ local_conf_header:
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks ssh-server-openssh"
     LICENSE_FLAGS_ACCEPTED:append =3D " ${@oe.utils.vartrue('FVP_BASE_R_=
ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
+    IMAGE_CLASSES:append =3D " testimage"
=20
 target:
   - core-image-minimal
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 8646bdf..7e45ff8 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -31,6 +31,12 @@ MACHINE_FEATURES:append =3D " efi"
 PACKAGECONFIG:remove:pn-openssh =3D "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
+# testimage configuration
+TEST_TARGET =3D "OEFVPTarget"
+TEST_SUITES =3D "ping ssh"
+TEST_TARGET_IP ?=3D "127.0.0.1:8022"
+TEST_SERVER_IP ?=3D "127.0.1.1"
+
 FVP_EXTRA_ARGS =3D "-a cluster0*=3D${DEPLOY_DIR_IMAGE}/linux-system.axf"
 FVP_PROVIDER ?=3D "fvp-base-r-aem-native"
 FVP_EXE ?=3D "FVP_BaseR_AEMv8R"
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 0b34d7f..9880896 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -234,6 +234,7 @@ Known Issues and Limitations
=20
 Change Log
 ----------
+- Enabled testimage support by default.
 - Added virtio\_rng to improve random number generation.
 - Added U-Boot v2022.01 for UEFI support.
 - Updated Linux kernel version from 5.14 to 5.15 for both standard and
--=20
2.25.1


