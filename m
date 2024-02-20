Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C990C5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:47:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16434.1708444070444095438
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 07:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2519A1007;
	Tue, 20 Feb 2024 07:48:29 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61F173F73F;
	Tue, 20 Feb 2024 07:47:49 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 1/4] meta-arm: Support firmware building under a multiconfig
Date: Tue, 20 Feb 2024 15:47:38 +0000
Message-ID: <20240220154741.66754-2-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220154741.66754-1-drew.reed@arm.com>
References: <20240220154741.66754-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Feb 2024 15:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5388

From: Drew Reed <Drew.Reed@arm.com>

To enable building rescue or bootstrap images that can be included into
firmware a "firmware" multiconfig option is required to allow the
building with different options to any mass storage image they may also
be built.

As this multiconfig build will occur under a different TMPDIR, we also
provide a deployment image to allow easy copying of the firmware into
another deploy dir.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 meta-arm/conf/multiconfig/firmware.conf       | 13 ++++++++
 .../images/firmware-deploy-image.bb           | 31 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arm/conf/multiconfig/firmware.conf
 create mode 100644 meta-arm/recipes-bsp/images/firmware-deploy-image.bb

diff --git a/meta-arm/conf/multiconfig/firmware.conf b/meta-arm/conf/mult=
iconfig/firmware.conf
new file mode 100644
index 00000000..95de4d24
--- /dev/null
+++ b/meta-arm/conf/multiconfig/firmware.conf
@@ -0,0 +1,13 @@
+# Config that can be used to build firmware in a seperate tmp area
+# and with a smaller libc enabled by default
+
+DISTROOVERRIDES =3D "firmware"
+
+TMPDIR:append =3D "_${MACHINE}"
+TCLIBC=3D"musl"
+
+# Ignore the testimage flags to include ssh-server-dropbear
+IMAGE_CLASSES:remove =3D "testimage"
+IMAGE_FEATURES:remove =3D "ssh-server-dropbear"
+CORE_IMAGE_EXTRA_INSTALL:remove =3D "ssh-pregen-hostkeys"
+TESTIMAGE_AUTO =3D "0"
diff --git a/meta-arm/recipes-bsp/images/firmware-deploy-image.bb b/meta-=
arm/recipes-bsp/images/firmware-deploy-image.bb
new file mode 100644
index 00000000..76c82738
--- /dev/null
+++ b/meta-arm/recipes-bsp/images/firmware-deploy-image.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "Firmware image deploying multi-config firmware"
+DESCRIPTION =3D "Image for deploying a firmware set on platforms using m=
ulti-config"
+LICENSE =3D "MIT"
+
+inherit deploy nopackages
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE ?=3D "invalid"
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+do_install[noexec] =3D "1"
+
+# Users of this recipe are expected to provide the list of firmware imag=
es
+# that need to be deployed by setting this variable.
+FIRMWARE_BINARIES ?=3D ""
+
+do_deploy() {
+    firmware_loc=3D"${TMPDIR}_${MACHINE}/deploy/images/${MACHINE}"
+    for firmware in ${FIRMWARE_BINARIES}; do
+        echo "cp -av ${firmware_loc}/${firmware} ${DEPLOYDIR}/"
+        cp -av "${firmware_loc}/${firmware}" ${DEPLOYDIR}/
+        if [ -L "${firmware_loc}/${firmware}" ]; then
+            echo "cp -av ${firmware_loc}/$(readlink ${firmware_loc}/${fi=
rmware}) ${DEPLOYDIR}/"
+            cp -av "${firmware_loc}/$(readlink ${firmware_loc}/${firmwar=
e})" ${DEPLOYDIR}/
+        fi
+    done
+}
+
+do_deploy[umask] =3D "022"
+
+addtask deploy after do_prepare_recipe_sysroot
--=20
2.43.0


