Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6347CCA0EC1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 17:19:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4935.1754414351018231683
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 10:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84B68150C
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A00A3F673
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm/optee: the build uses lld if using clang
Date: Tue,  5 Aug 2025 18:19:02 +0100
Message-ID: <20250805171903.277422-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805171903.277422-1-ross.burton@arm.com>
References: <20250805171903.277422-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Aug 2025 17:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6660

The OP-TEE suite of packages use lld if the compiler is clang, so now
that the lld recipe has been split out of the clang recipe we need to
depend on both.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb | 1 +
 meta-arm/recipes-security/optee/optee-os.inc               | 2 +-
 meta-arm/recipes-security/optee/optee-test.inc             | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb
index 961d525179..cca9f62abc 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb
@@ -5,6 +5,7 @@ DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
 HOMEPAGE =3D "https://www.op-tee.org/"
=20
 DEPENDS +=3D "python3-pycryptodome-native"
+DEPENDS:append:toolchain-clang =3D " lld-native"
=20
 do_install() {
     #install TA devkit
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index cf50dabed3..973a421666 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -12,7 +12,7 @@ CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
=20
 DEPENDS =3D "python3-pyelftools-native python3-cryptography-native"
=20
-DEPENDS:append:toolchain-clang =3D " compiler-rt"
+DEPENDS:append:toolchain-clang =3D " lld-native compiler-rt"
=20
 SRC_URI =3D "git://github.com/OP-TEE/optee_os.git;branch=3Dmaster;protoc=
ol=3Dhttps"
=20
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 6f81f0de6d..397515f9c4 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -9,6 +9,7 @@ inherit deploy
 require optee.inc
=20
 DEPENDS =3D "optee-client optee-os-tadevkit python3-cryptography-native =
openssl"
+DEPENDS:append:toolchain-clang =3D " lld-native"
=20
 SRC_URI =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmaster;prot=
ocol=3Dhttps \
            file://run-ptest \
--=20
2.43.0


