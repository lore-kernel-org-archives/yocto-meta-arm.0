Return-Path: <arthur.cassegrain@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC37CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 12:24:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14157.1781699073584213947
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 05:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=BhbMzBTA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arthur.cassegrain@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C8674794;
	Wed, 17 Jun 2026 05:24:28 -0700 (PDT)
Received: from e142502.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFF053F905;
	Wed, 17 Jun 2026 05:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781699072; bh=C+POxn33MRIDIY0rPGe/vIpgN+jp2XHm3x7tzydC+hY=;
	h=From:To:Cc:Subject:Date:From;
	b=BhbMzBTAVE2/EnYGk3jL09DqLHkhhT2+W+9PsNF0VY1CJ1xT1tf7sVOrgggtAtaov
	 V2ZHQRWrbcUy2NunYBHmKpOMuOaja/j6QE6IO3PW3grooYNBq+YSi4H6pP+RiR9zY5
	 1VVckzOQBfQ6pspzm78bfWE0qL6AT9C+y3DQbyx0=
From: arthur.cassegrain@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Arthur Cassegrain <arthur.cassegrain@arm.com>
Subject: [PATCH] arm/trusted-services: enable devtool modify for ts-psa-api-test
Date: Wed, 17 Jun 2026 14:23:29 +0200
Message-ID: <20260617122329.2485831-1-arthur.cassegrain@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 12:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7080

From: Arthur Cassegrain <arthur.cassegrain@arm.com>

Place psa-arch-tests under ${S}/ts-external/psatest and update the
recipe paths to match.

This keeps the external source layout aligned with trusted-services,
updates the Corstone-1000 patch locations, and lets devtool modify work
against the same psa-arch-tests tree that CMake and
apply_local_src_patches use.

Signed-off-by: Arthur Cassegrain <arthur.cassegrain@arm.com>
---
 .../trusted-services/ts-psa-api-test.inc               |  8 ++++----
 .../trusted-services/ts-psa-api-test-common_git.inc    | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-te=
st.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.i=
nc
index 006bcdef..70bd8621 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
@@ -3,8 +3,8 @@ FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/cor=
stone1000/psa-apitest:"
 include ts-arm-platforms.inc
=20
 SRC_URI:append:corstone1000  =3D " \
-    file://0001-corstone1000-port-crypto-config.patch;patchdir=3D../psat=
est \
-    file://0002-corstone1000-Disable-obsolete-algorithms.patch;patchdir=3D=
../psatest \
-    file://0003-corstone1000-Disable-SHA512-384.patch;patchdir=3D../psat=
est \
-    file://0004-Remove-RSA-support.patch;patchdir=3D../psatest \
+    file://0001-corstone1000-port-crypto-config.patch;patchdir=3D../ts/t=
s-external/psatest \
+    file://0002-corstone1000-Disable-obsolete-algorithms.patch;patchdir=3D=
../ts/ts-external/psatest \
+    file://0003-corstone1000-Disable-SHA512-384.patch;patchdir=3D../ts/t=
s-external/psatest \
+    file://0004-Remove-RSA-support.patch;patchdir=3D../ts/ts-external/ps=
atest \
     "
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-c=
ommon_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-tes=
t-common_git.inc
index aacd09c3..f0421577 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
@@ -9,17 +9,17 @@ DEPENDS        +=3D "python3-jsonschema-native python3-=
jinja2-native"
 DEPENDS        +=3D "libpsats"
 RDEPENDS:${PN} +=3D "libpsats"
=20
-SRC_URI +=3D "git://github.com/ARM-software/psa-arch-tests.git;name=3Dps=
atest;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dpsatest \
-            file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-nati=
ve.patch;patchdir=3D../psatest \
+SRC_URI +=3D "git://github.com/ARM-software/psa-arch-tests.git;name=3Dps=
atest;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dts/ts-external/psatest =
\
+            file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-nati=
ve.patch;patchdir=3D../ts/ts-external/psatest \
            "
=20
 SRCREV_psatest =3D "74dc6646ff594e131a726a5305aba77bac30eceb"
-LIC_FILES_CHKSUM +=3D "file://../psatest/LICENSE.md;md5=3D2a944942e1496a=
f1886903d274dedb13"
+LIC_FILES_CHKSUM +=3D "file://${S}/ts-external/psatest/LICENSE.md;md5=3D=
2a944942e1496af1886903d274dedb13"
=20
-EXTRA_OECMAKE +=3D "-DPSA_ARCH_TESTS_SOURCE_DIR=3D${WORKDIR}/sources/psa=
test"
+EXTRA_OECMAKE +=3D "-DPSA_ARCH_TESTS_SOURCE_DIR=3D${S}/ts-external/psate=
st"
=20
 do_apply_local_src_patches:append() {
-    apply_local_src_patches ${S}/external/psa_arch_tests ${WORKDIR}/sour=
ces/psatest
+    apply_local_src_patches ${S}/external/psa_arch_tests ${S}/ts-externa=
l/psatest
 }
=20
 FILES:${PN} =3D "${bindir}/${PSA_TEST}"
--=20
2.43.0


