Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E891BC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:14:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13410.1698858862673322525
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 10:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D90A2F4;
	Wed,  1 Nov 2023 10:15:04 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3160A3F738;
	Wed,  1 Nov 2023 10:14:22 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] arm/optee: cleanups from code review
Date: Wed,  1 Nov 2023 09:35:48 -0500
Message-Id: <20231101143548.2175-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Nov 2023 17:14:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5195

Comments were made after previous optee changes were committed.
Addressing those comments here.

Suggested-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb | 4 ----
 meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb | 4 ----
 meta-arm/recipes-security/optee/optee-test.inc           | 5 ++++-
 meta-arm/recipes-security/optee/optee-test_4.%.bbappend  | 0
 meta-arm/recipes-security/optee/optee-test_4.0.0.bb      | 4 ----
 5 files changed, 4 insertions(+), 13 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_4.%.bbappe=
nd

diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
index 5f73d414..4409ad5f 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
@@ -6,7 +6,3 @@ SRC_URI +=3D " \
     file://0003-Update-arm_ffa_user-driver-dependency.patch \
    "
 SRCREV =3D "5db8ab4c733d5b2f4afac3e9aef0a26634c4b444"
-
-EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
-DEPENDS:append =3D " openssl"
-CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb
index f1444a1d..eddf04d8 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.22.0.bb
@@ -5,10 +5,6 @@ SRC_URI +=3D " \
    "
 SRCREV =3D "a286b57f1721af215ace318d5807e63f40186df6"
=20
-EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
-DEPENDS:append =3D " openssl"
-CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
-
 # Include ffa_spmc test group if the SPMC test is enabled.
 # Supported after op-tee v3.20
 EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 90b72b9f..58f10139 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -9,7 +9,7 @@ inherit python3native ptest
 inherit deploy
 require optee.inc
=20
-DEPENDS =3D "optee-client optee-os-tadevkit python3-cryptography-native"
+DEPENDS =3D "optee-client optee-os-tadevkit python3-cryptography-native =
openssl"
=20
 SRC_URI =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmaster;prot=
ocol=3Dhttps \
            file://run-ptest \
@@ -19,11 +19,14 @@ S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
+                 OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR} \
                  CROSS_COMPILE_HOST=3D${HOST_PREFIX} \
                  CROSS_COMPILE_TA=3D${HOST_PREFIX} \
                  O=3D${B} \
                "
=20
+CFLAGS +=3D "-Wno-error=3Ddeprecated-declarations"
+
 do_compile() {
     cd ${S}
     # Top level makefile doesn't seem to handle parallel make gracefully
diff --git a/meta-arm/recipes-security/optee/optee-test_4.%.bbappend b/me=
ta-arm/recipes-security/optee/optee-test_4.%.bbappend
deleted file mode 100644
index e69de29b..00000000
diff --git a/meta-arm/recipes-security/optee/optee-test_4.0.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.0.0.bb
index c5a473be..ecd949f4 100644
--- a/meta-arm/recipes-security/optee/optee-test_4.0.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_4.0.0.bb
@@ -2,10 +2,6 @@ require recipes-security/optee/optee-test.inc
=20
 SRCREV =3D "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
=20
-EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
-DEPENDS:append =3D " openssl"
-CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
-
 # Include ffa_spmc test group if the SPMC test is enabled.
 # Supported after op-tee v3.20
 EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
--=20
2.30.2


