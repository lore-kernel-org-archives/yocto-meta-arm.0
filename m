Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA796C6FA9D
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 12:05:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6956.1677067510322111453
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 04:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7652139F;
	Wed, 22 Feb 2023 04:05:52 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8642A3F881;
	Wed, 22 Feb 2023 04:05:09 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 5/6] arm/trusted-firmware-m-scripts: Create inc file for common config
Date: Wed, 22 Feb 2023 12:04:40 +0000
Message-Id: <20230222120441.2684534-5-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222120441.2684534-1-peter.hoyes@arm.com>
References: <20230222120441.2684534-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 12:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4441

From: Peter Hoyes <Peter.Hoyes@arm.com>

To simplify adding support for new versions of TF-M scripts in the
future, create a common .inc file with the non-version-specific
configuration.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../trusted-firmware-m-scripts-native.inc     | 25 +++++++++++++++++
 ...trusted-firmware-m-scripts-native_1.7.0.bb | 27 +------------------
 2 files changed, 26 insertions(+), 26 deletions(-)
 create mode 100644 meta-arm/recipes-devtools/trusted-firmware-m-scripts/=
trusted-firmware-m-scripts-native.inc

diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native.inc b/meta-arm/recipes-devtools/trusted-firmwa=
re-m-scripts/trusted-firmware-m-scripts-native.inc
new file mode 100644
index 00000000..afe655f8
--- /dev/null
+++ b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native.inc
@@ -0,0 +1,25 @@
+SUMMARY =3D "Trusted Firmware image signing scripts"
+DESCRIPTION =3D "Trusted Firmware-M image signing scripts"
+HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
+
+inherit native
+
+# See bl2/ext/mcuboot/scripts/requirements.txt
+RDEPENDS:${PN} =3D "\
+    python3-cryptography-native \
+    python3-pyasn1-native \
+    python3-pyyaml-native \
+    python3-cbor2-native \
+    python3-imgtool-native \
+    python3-click-native \
+"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -d ${D}/${libdir}
+    cp -rf ${S}/bl2/ext/mcuboot/scripts/ ${D}/${libdir}/tfm-scripts
+    cp -rf ${S}/bl2/ext/mcuboot/*.pem ${D}/${libdir}/tfm-scripts
+}
+FILES:${PN} =3D "${libdir}/tfm-scripts"
diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native_1.7.0.bb b/meta-arm/recipes-devtools/trusted-f=
irmware-m-scripts/trusted-firmware-m-scripts-native_1.7.0.bb
index cd273593..2e9e5249 100644
--- a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.7.0.bb
+++ b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.7.0.bb
@@ -1,27 +1,2 @@
-SUMMARY =3D "Trusted Firmware image signing scripts"
-DESCRIPTION =3D "Trusted Firmware-M image signing scripts"
-HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
-
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
-
-inherit native
-
-# See bl2/ext/mcuboot/scripts/requirements.txt
-RDEPENDS:${PN} =3D "\
-    python3-cryptography-native \
-    python3-pyasn1-native \
-    python3-pyyaml-native \
-    python3-cbor2-native \
-    python3-imgtool-native \
-    python3-click-native \
-"
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-
-do_install() {
-    install -d ${D}/${libdir}
-    cp -rf ${S}/bl2/ext/mcuboot/scripts/ ${D}/${libdir}/tfm-scripts
-    cp -rf ${S}/bl2/ext/mcuboot/*.pem ${D}/${libdir}/tfm-scripts
-}
-FILES:${PN} =3D "${libdir}/tfm-scripts"
+require recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-s=
cripts-native.inc
--=20
2.34.1


