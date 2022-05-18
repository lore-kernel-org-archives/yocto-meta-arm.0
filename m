Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393D8C43217
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 13:14:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4818.1652879648589924736
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 06:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3979123A;
	Wed, 18 May 2022 06:14:08 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.2.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 076D73F73D;
	Wed, 18 May 2022 06:14:06 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	emeara01 <emekcan.aras@arm.com>,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 1/3] arm/trusted-firmware-a: upgrade mbedtls to 2.28
Date: Wed, 18 May 2022 14:13:54 +0100
Message-Id: <20220518131356.86191-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518131356.86191-1-emekcan.aras@arm.com>
References: <20220518131356.86191-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 13:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3433

From: emeara01 <emekcan.aras@arm.com>

The latest TF-A version requires mbedtls v2.28. This
commit upgrades mbedtls to v2.28 for TF-A recipe.
An upstreamed patch included to the base recipe from TF-A master
that fixes the build issues beween TF-A 2.6 and Mbedtls 2.28.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 ...uild-deps-upgrade-to-mbed-TLS-2.28.0.patch | 72 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  4 +-
 .../trusted-firmware-a_2.6.bb                 |  6 +-
 3 files changed, 78 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/build-d=
eps-upgrade-to-mbed-TLS-2.28.0.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upg=
rade-to-mbed-TLS-2.28.0.patch b/meta-arm/recipes-bsp/trusted-firmware-a/f=
iles/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
new file mode 100644
index 00000000..058423c6
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to=
-mbed-TLS-2.28.0.patch
@@ -0,0 +1,72 @@
+Upstream-Status: Backport
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+From a93084be95634b66b917f1c8baf403067dc75c5d Mon Sep 17 00:00:00 2001
+From: Sandrine Bailleux <sandrine.bailleux@arm.com>
+Date: Thu, 21 Apr 2022 10:21:29 +0200
+Subject: [PATCH] build(deps): upgrade to mbed TLS 2.28.0
+
+Upgrade to the latest and greatest 2.x release of Mbed TLS library
+(i.e. v2.28.0) to take advantage of their bug fixes.
+
+Note that the Mbed TLS project published version 3.x some time
+ago. However, as this is a major release with API breakages, upgrading
+to 3.x might require some more involved changes in TF-A, which we are
+not ready to do. We shall upgrade to mbed TLS 3.x after the v2.7
+release of TF-A.
+
+Actually, the upgrade this time simply boils down to including the new
+source code module 'constant_time.c' into the firmware.
+
+To quote mbed TLS v2.28.0 release notes [1]:
+
+  The mbedcrypto library includes a new source code module
+  constant_time.c, containing various functions meant to resist timing
+  side channel attacks. This module does not have a separate
+  configuration option, and functions from this module will be
+  included in the build as required.
+
+As a matter of fact, if one is attempting to link TF-A against mbed
+TLS v2.28.0 without the present patch, one gets some linker errors
+due to missing symbols from this new module.
+
+Apart from this, none of the items listed in mbed TLS release
+notes [1] directly affect TF-A. Special note on the following one:
+
+  Fix a bug in mbedtls_gcm_starts() when the bit length of the iv
+  exceeds 2^32.
+
+In TF-A, we do use mbedtls_gcm_starts() when the firmware decryption
+feature is enabled with AES-GCM as the authenticated decryption
+algorithm (DECRYPTION_SUPPORT=3Daes_gcm). However, the iv_len variable
+which gets passed to mbedtls_gcm_starts() is an unsigned int, i.e. a
+32-bit value which by definition is always less than 2**32. Therefore,
+we are immune to this bug.
+
+With this upgrade, the size of BL1 and BL2 binaries does not appear to
+change on a standard sample test build (with trusted boot and measured
+boot enabled).
+
+[1] https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.0
+
+Change-Id: Icd5dbf527395e9e22c8fd6b77427188bd7237fd6
+Signed-off-by: Sandrine Bailleux <sandrine.bailleux@arm.com>
+---
+ drivers/auth/mbedtls/mbedtls_common.mk | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/auth/mbedtls/mbedtls_common.mk b/drivers/auth/mbedt=
ls/mbedtls_common.mk
+index 0a4775d00..3eb41617f 100644
+--- a/drivers/auth/mbedtls/mbedtls_common.mk
++++ b/drivers/auth/mbedtls/mbedtls_common.mk
+@@ -48,6 +48,7 @@ LIBMBEDTLS_SRCS		:=3D $(addprefix ${MBEDTLS_DIR}/libra=
ry/,	\
+ 					rsa_internal.c				\
+ 					x509.c 					\
+ 					x509_crt.c 				\
++					constant_time.c 			\
+ 					)
+=20
+ # The platform may define the variable 'TF_MBEDTLS_KEY_ALG' to select t=
he key
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 2e3b50c5..510a7d44 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -6,7 +6,9 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit deploy
=20
 SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa;branch=3Dmaster \
-           file://ssl.patch"
+           file://ssl.patch \
+	    file://build-deps-upgrade-to-mbed-TLS-2.28.0.patch"
+
 UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
=20
 SRCREV_FORMAT =3D "tfa"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
index ec1bec95..89a92141 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
@@ -5,8 +5,8 @@ SRCREV_tfa =3D "a1f02f4f3daae7e21ee58b4c93ec3e46b8f28d15"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
-# mbed TLS v2.26.0
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
-SRCREV_mbedtls =3D "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
+# mbed TLS v2.28.0
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.28"
+SRCREV_mbedtls =3D "8b3f26a5ac38d4fdccbc5c5366229f3e01dafcc0"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.25.1


