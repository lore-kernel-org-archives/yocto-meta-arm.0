Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B40ACA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:07:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9263.1790939248849603009
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2026 04:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=YE22rECe;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF385497
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Oct 2026 04:07:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7CCE3F85F
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Oct 2026 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790939248; bh=CJitocfl4IdyitX5dYCIm+rczv5jKEBFvlOHYGow1JU=;
	h=From:To:Subject:Date:From;
	b=YE22rECe1jDL1IFCnbIGYGaixE+WvMyqcZYQBceKqY6VImWH8v5ozNRXLL0cfLD7A
	 KVf0WMue0jmx6f+UVQLYwOvCd/YG2KLo0vRIoNa2PmYg4dJP9Tixa1+bEtR1ugUfir
	 gprdXBNNoq/YVxliSKfmtz4iH6XdC35iQ8oxuTl0=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/trusted-services: conditionally require platforms configuration file
Date: Fri,  2 Oct 2026 12:07:23 +0100
Message-ID: <20261002110723.2220997-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Oct 2026 11:07:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7183

From: Clement Faure <clement.faure@arm.com>

Guard the inclusion of platform configuration files behind an override.
This prevents unwanted platform overrides from leaking in
DEVTOOL_EXTRA_OVERRIDES of other platform builds.

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
 .../ts-arm-platforms-corstone1000.inc         | 16 ++++++++++++++
 .../ts-arm-platforms-fvp-base.inc             |  3 +++
 .../trusted-services/ts-arm-platforms.inc     | 21 ++++---------------
 ...t.inc =3D> ts-psa-api-test-corstone1000.inc} |  8 +++----
 .../ts-psa-crypto-api-test_%.bbappend         |  7 ++++++-
 .../ts-psa-iat-api-test_%.bbappend            |  7 ++++++-
 .../ts-psa-its-api-test_%.bbappend            |  8 ++++++-
 .../ts-psa-ps-api-test_%.bbappend             |  7 ++++++-
 8 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-arm=
-platforms-corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-arm=
-platforms-fvp-base.inc
 rename meta-arm-bsp/recipes-security/trusted-services/{ts-psa-api-test.i=
nc =3D> ts-psa-api-test-corstone1000.inc} (70%)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-=
arm-platforms-corstone1000.inc
new file mode 100644
index 00000000000..d2be149d79a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms-cor=
stone1000.inc
@@ -0,0 +1,16 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/corstone1000:"
+
+COMPATIBLE_MACHINE =3D "corstone1000"
+
+SRC_URI:append  =3D " \
+    file://0001-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
+    file://0002-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
+"
+
+# The patches above introduce errors with GCC 14.1, silence them for now
+CFLAGS:append =3D " -Wno-int-conversion -Wno-implicit-function-declarati=
on"
+
+EXTRA_OECMAKE:append =3D " \
+    -DCORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE} \
+    -DCMAKE_COMPILE_WARNING_AS_ERROR=3DOFF \
+"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms-fvp-base.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-=
platforms-fvp-base.inc
new file mode 100644
index 00000000000..2f712b928b0
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms-fvp=
-base.inc
@@ -0,0 +1,3 @@
+COMPATIBLE_MACHINE =3D "fvp-base"
+TS_PLATFORM =3D "arm/fvp/fvp_base_revc-2xaemv8a"
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 5ba8d5f5f11..1c777d40261 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -1,18 +1,5 @@
-FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/corstone1000:"
+MACHINE_TS_REQUIRE ?=3D ""
+MACHINE_TS_REQUIRE:corstone1000 =3D "ts-arm-platforms-corstone1000.inc"
+MACHINE_TS_REQUIRE:fvp-base =3D "ts-arm-platforms-fvp-base.inc"
=20
-COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
-SRC_URI:append:corstone1000  =3D " \
-    file://0001-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
-    file://0002-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
-"
-
-# The patches above introduce errors with GCC 14.1, silence them for now
-CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"
-
-COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
-TS_PLATFORM:fvp-base =3D "arm/fvp/fvp_base_revc-2xaemv8a"
-
-EXTRA_OECMAKE:append:corstone1000 =3D " \
-    -DCORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE} \
-    -DCMAKE_COMPILE_WARNING_AS_ERROR=3DOFF \
-"
+require ${MACHINE_TS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-te=
st.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test-c=
orstone1000.inc
similarity index 70%
rename from meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-tes=
t.inc
rename to meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test-=
corstone1000.inc
index 70bd8621985..24cdb01cf79 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test-cors=
tone1000.inc
@@ -1,10 +1,8 @@
-FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/corstone1000/psa-a=
pitest:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/corstone1000/psa-apitest:"
=20
-include ts-arm-platforms.inc
-
-SRC_URI:append:corstone1000  =3D " \
+SRC_URI:append  =3D " \
     file://0001-corstone1000-port-crypto-config.patch;patchdir=3D../ts/t=
s-external/psatest \
     file://0002-corstone1000-Disable-obsolete-algorithms.patch;patchdir=3D=
../ts/ts-external/psatest \
     file://0003-corstone1000-Disable-SHA512-384.patch;patchdir=3D../ts/t=
s-external/psatest \
     file://0004-Remove-RSA-support.patch;patchdir=3D../ts/ts-external/ps=
atest \
-    "
+"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto=
-api-test_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-=
psa-crypto-api-test_%.bbappend
index ea49213e899..eeff2ebf4f3 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-te=
st_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-te=
st_%.bbappend
@@ -1 +1,6 @@
-require ts-psa-api-test.inc
+PSA_TEST_TS_REQUIRE ?=3D ""
+PSA_TEST_TS_REQUIRE:corstone1000 =3D "ts-psa-api-test-corstone1000.inc"
+
+require ${PSA_TEST_TS_REQUIRE}
+
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-ap=
i-test_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa=
-iat-api-test_%.bbappend
index ea49213e899..eeff2ebf4f3 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_=
%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_=
%.bbappend
@@ -1 +1,6 @@
-require ts-psa-api-test.inc
+PSA_TEST_TS_REQUIRE ?=3D ""
+PSA_TEST_TS_REQUIRE:corstone1000 =3D "ts-psa-api-test-corstone1000.inc"
+
+require ${PSA_TEST_TS_REQUIRE}
+
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-ap=
i-test_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa=
-its-api-test_%.bbappend
index ea49213e899..a72dab4a9e8 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_=
%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_=
%.bbappend
@@ -1 +1,7 @@
-require ts-psa-api-test.inc
+PSA_TEST_TS_REQUIRE ?=3D ""
+PSA_TEST_TS_REQUIRE:corstone1000 =3D "ts-psa-api-test-corstone1000.inc"
+
+require ${PSA_TEST_TS_REQUIRE}
+
+require ts-arm-platforms.inc
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api=
-test_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-=
ps-api-test_%.bbappend
index ea49213e899..eeff2ebf4f3 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_%=
.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_%=
.bbappend
@@ -1 +1,6 @@
-require ts-psa-api-test.inc
+PSA_TEST_TS_REQUIRE ?=3D ""
+PSA_TEST_TS_REQUIRE:corstone1000 =3D "ts-psa-api-test-corstone1000.inc"
+
+require ${PSA_TEST_TS_REQUIRE}
+
+require ts-arm-platforms.inc
--=20
2.43.0


