Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5B7C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 16:32:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.14378.1642696329315871746
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 08:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E417B11FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 08:32:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F4CC3F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 08:32:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] meta-arm-bsp: use old python3-crytography on platforms
 using TF-M
Date: Thu, 20 Jan 2022 16:32:06 +0000
Message-Id: <20220120163206.1950366-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120163206.1950366-1-ross.burton@arm.com>
References: <20220120163206.1950366-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 16:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2877

As the latest python3-crytography breaks TF-M builds, downgrade those
machines using TF-M (musca and corstone) to python3-crytography-native
3.3.2 temporarily.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/layer.conf                       | 6 +++++-
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 5 +++++
 meta-arm-bsp/conf/machine/musca-b1.conf            | 5 +++++
 meta-arm-bsp/conf/machine/musca-s1.conf            | 5 +++++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 45767866..82230470 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -21,4 +21,8 @@ LAYERDEPENDS_meta-arm-bsp:append:musca-s1 =3D " meta-py=
thon"
 LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
=20
 # Delete this when our downgrade of python3-cryptography is removed
-BBMASK +=3D "meta-arm-bsp/recipes-devtools/python/python3-cryptography_3=
.3.2.bb"
+META_ARM_PYCRYPTO =3D "meta-arm-bsp/recipes-devtools/python/python3-cryp=
tography_3.3.2.bb"
+META_ARM_PYCRYPTO:corstone1000 =3D ""
+META_ARM_PYCRYPTO:musca-b1 =3D ""
+META_ARM_PYCRYPTO:musca-s1 =3D ""
+BBMASK +=3D "${META_ARM_PYCRYPTO}"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index f9d301e4..019293b0 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -63,3 +63,8 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 WKS_FILE ?=3D "corstone1000-image.corstone1000.wks"
+
+# The latest python3-cryptography-native doesn't work
+# (cryptography.exceptions.InternalError: Unknown OpenSSL error) so use =
the
+# version before Rust was involved for now.
+PREFERRED_VERSION_python3-cryptography-native =3D "3.3.2"
diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index 073c466e..ec5ff4ee 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -26,3 +26,8 @@ ZEPHYR_INHERIT_CLASSES +=3D "zephyr-qemuboot"
 ARCH:musca-b1 =3D "arm"
=20
 TFM_PLATFORM =3D "arm/musca_b1/sse_200"
+
+# The latest python3-cryptography-native doesn't work
+# (cryptography.exceptions.InternalError: Unknown OpenSSL error) so use =
the
+# version before Rust was involved for now.
+PREFERRED_VERSION_python3-cryptography-native =3D "3.3.2"
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/=
machine/musca-s1.conf
index d18c06c2..e5f63f76 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -25,3 +25,8 @@ ZEPHYR_INHERIT_CLASSES +=3D "zephyr-qemuboot"
 ARCH:musca-s1 =3D "arm"
=20
 TFM_PLATFORM =3D "arm/musca_s1"
+
+# The latest python3-cryptography-native doesn't work
+# (cryptography.exceptions.InternalError: Unknown OpenSSL error) so use =
the
+# version before Rust was involved for now.
+PREFERRED_VERSION_python3-cryptography-native =3D "3.3.2"
--=20
2.25.1


