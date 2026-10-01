Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C37CA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 17:06:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16405.1790874377027172653
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 10:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=MP3qDlXd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA67497
	for <meta-arm@lists.yoctoproject.org>; Thu,  1 Oct 2026 10:06:12 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0FFF53F86F
	for <meta-arm@lists.yoctoproject.org>; Thu,  1 Oct 2026 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790874376; bh=rjZy1WoPVonlS0Bk16X99C28D5MBrhCNoCZifwbVU30=;
	h=From:To:Subject:Date:From;
	b=MP3qDlXdeWqhYH8cS7XgCYnW9ZTi9wt7WqdgOhzuCwXeFiIVXi5rauCWHrQjxbDYJ
	 F7W8Tnbf7T97DIlfxv1SGOOXRm/5E0EofAsfyhj1R0GmNXKkM0AXGISp4ZrRGdy6+x
	 T4r2gOA2pGZ+o8ckg0AvIVqqnR2wVg2oUgvQBpxA=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: update LTS to 2.14.9
Date: Thu,  1 Oct 2026 13:06:14 -0400
Message-ID: <20261001170614.17980-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Oct 2026 17:06:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7182

Update the TF-A LTS recipes to the lts-v2.14.9 tag.

This release adds mbedTLS as a submodule, matching how newer TF-A release=
s
provide this dependency.  This is a change from earlier releases in the
2.14 LTS series and requires the mbedTLS sources to be fetched as part of
the TF-A source tree.

Also update fiptool-native to use the corresponding TF-A 2.14.9 revision.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ive_2.14.2.bb =3D> fiptool-native_2.14.9.bb} |  4 +-
 .../trusted-firmware-a_2.14.2.bb              | 38 -------------------
 .../trusted-firmware-a_2.14.9.bb              | 10 +++++
 3 files changed, 12 insertions(+), 40 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.14.2.bb=
 =3D> fiptool-native_2.14.9.bb} (92%)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.14.2.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.14.9.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.=
2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.9.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.2=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.9.b=
b
index b6d302d47354..7c4983c49eda 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.2.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.9.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirm=
ware.org/TF-A/trusted-fir
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
=20
-# Use fiptool from TF-A v2.14.2
-SRCREV =3D "aa1793fff49a1b5a6a877c278a0df0a188e2b1f2"
+# Use fiptool from TF-A v2.14.9
+SRCREV =3D "16868ce4eafdbf7903fcd7eb15429d4e8b258de4"
 SRCBRANCH =3D "lts-v2.14"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.14.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
4.2.bb
deleted file mode 100644
index 9c70d0b5819b..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.b=
b
+++ /dev/null
@@ -1,38 +0,0 @@
-require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
-
-# TF-A v2.14.2
-SRC_URI_TRUSTED_FIRMWARE_A =3D "gitsm://review.trustedfirmware.org/TF-A/=
trusted-firmware-a;protocol=3Dhttps"
-SRCREV_tfa =3D "aa1793fff49a1b5a6a877c278a0df0a188e2b1f2"
-SRCBRANCH =3D "lts-v2.14"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
-
-# mbed TLS support (set TFA_MBEDTLS to 1 to activate)
-TFA_MBEDTLS ?=3D "0"
-# sub-directory in which mbedtls will be downloaded
-# Only needed for legacy versions, as v2.15.0 added this as a git submod=
ule
-TFA_MBEDTLS_DIR ?=3D "mbedtls"
-# This should be set to MBEDTLS download URL if MBEDTLS is needed
-SRC_URI_MBEDTLS ??=3D ""
-# This should be set to MBEDTLS LIC FILES checksum
-LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
-# add MBEDTLS to our sources if activated
-SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
-# Update license variables
-LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND Apach=
e-2.0', '', d)}"
-LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
-# add mbed TLS to version
-SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
-
-# Handle MBEDTLS
-EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=
=3D${TFA_MBEDTLS_DIR}', '', d)}"
-
-# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.5
-SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;=
protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=
=3D${SRCBRANCH_MBEDTLS}"
-SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
-
-SRC_URI +=3D "file://0001-feat-build-add-HOSTLDFLAGS-to-pass-flags-to-ho=
st-lin.patch"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.14.9.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
4.9.bb
new file mode 100644
index 000000000000..1433fd7ee1c1
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.9.b=
b
@@ -0,0 +1,10 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A v2.14.9
+SRC_URI_TRUSTED_FIRMWARE_A =3D "gitsm://review.trustedfirmware.org/TF-A/=
trusted-firmware-a;protocol=3Dhttps"
+SRCREV_tfa =3D "16868ce4eafdbf7903fcd7eb15429d4e8b258de4"
+SRCBRANCH =3D "lts-v2.14"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
+
+SRC_URI +=3D "file://0001-feat-build-add-HOSTLDFLAGS-to-pass-flags-to-ho=
st-lin.patch"
--=20
2.54.0 (Apple Git-157)


