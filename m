Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94018C5478B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:47:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16338.1708444072553726682
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 07:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46ABE1007;
	Tue, 20 Feb 2024 07:48:31 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 833F53F73F;
	Tue, 20 Feb 2024 07:47:51 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 3/4] bsp: Restore the ability to build firmware only
Date: Tue, 20 Feb 2024 15:47:40 +0000
Message-ID: <20240220154741.66754-4-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220154741.66754-1-drew.reed@arm.com>
References: <20240220154741.66754-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Feb 2024 15:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5390

From: Drew Reed <Drew.Reed@arm.com>

To allow us to continue to ship Corstone-1000 releases that only include
the firmware with the built in Linux image we need a way to build it
outside of the multiconfig builds.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 ci/corstone1000-firmware-only.yml             | 25 +++++++++++++++++++
 .../conf/machine/include/corstone1000.inc     |  7 +++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 ci/corstone1000-firmware-only.yml

diff --git a/ci/corstone1000-firmware-only.yml b/ci/corstone1000-firmware=
-only.yml
new file mode 100644
index 00000000..9cc4299a
--- /dev/null
+++ b/ci/corstone1000-firmware-only.yml
@@ -0,0 +1,25 @@
+---
+header:
+  version: 14
+
+local_conf_header:
+  rescuebuild: |
+    # Need to ensure the rescue linux options are selected
+    OVERRIDES .=3D ":firmware"
+
+    # Need to ensure we build with a small libc
+    TCLIBC=3D"musl"
+
+  mass-storage: |
+    # Ensure the Mass Storage device is absent
+    FVP_CONFIG[board.msd_mmc.p_mmc_file] =3D "invalid.dat"
+
+  test-configuration: |
+    TEST_SUITES =3D "_qemutiny ping"
+    # Remove Dropbear SSH as it will not fit into the corstone1000 image=
.
+    IMAGE_FEATURES:remove =3D "ssh-server-dropbear"
+    CORE_IMAGE_EXTRA_INSTALL:remove =3D "ssh-pregen-hostkeys"
+
+target:
+  - corstone1000-flash-firmware-image
+  - perf
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index a88f19c4..8d793426 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -54,6 +54,7 @@ WKS_FILE:firmware ?=3D "corstone1000-flash-firmware.wks=
.in"
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
-# If not build under the firmware multiconf we need to build the actual =
firmware
-EXTRA_IMAGEDEPENDS =3D "${@bb.utils.contains('DISTROOVERRIDES', 'firmwar=
e', \
-                        '', 'firmware-deploy-image', d)}"
+# If not building under the firmware multiconf we need to build the actu=
al firmware
+FIRMWARE_DEPLOYEMENT ?=3D "firmware-deploy-image"
+FIRMWARE_DEPLOYEMENT:firmware ?=3D ""
+EXTRA_IMAGEDEPENDS +=3D "${FIRMWARE_DEPLOYEMENT}"
--=20
2.43.0


