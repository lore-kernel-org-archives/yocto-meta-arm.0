Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32DBC43217
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.613.1651683511348012554
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4127111FB;
	Wed,  4 May 2022 09:58:30 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A229D3FA27;
	Wed,  4 May 2022 09:58:29 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 02/10] arm-bsp/optee: TC: Set preferred version of OP-TEE to
 v3.14
Date: Wed,  4 May 2022 17:58:12 +0100
Message-Id: <20220504165820.882784-2-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3358

This also adds missing optee-os-tadevkit, optee-test append files

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I1a217d9db7378f3ec711e984193b07ebb692e382
---
 meta-arm-bsp/conf/machine/include/tc.inc                  | 5 +++++
 .../optee/optee-os-tadevkit_3.14.0.bbappend               | 6 ++++++
 .../recipes-security/optee/optee-test_3.14.0.bbappend     | 8 ++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_3.14.0.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.14.0=
.bbappend

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index 71cb17cd..0658dfbc 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -25,6 +25,11 @@ FIT_GENERATE_KEYS =3D "1"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
 PREFERRED_VERSION_linux-arm64-ack ?=3D "5.10"
=20
+# OP-TEE
+PREFERRED_VERSION_optee-os ?=3D "3.14%"
+PREFERRED_VERSION_optee-client ?=3D "3.14%"
+PREFERRED_VERSION_optee-test ?=3D "3.14%"
+
 # Cannot use the default zImage on arm64
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPES +=3D "fitImage"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0=
.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.=
bbappend
new file mode 100644
index 00000000..6a22d47e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappe=
nd
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D "optee-os-generic-tc.inc"
+
+require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
new file mode 100644
index 00000000..f8194d0e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
@@ -0,0 +1,8 @@
+# Machine specific configurations
+
+DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-native"
+
+MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
+MACHINE_OPTEE_TEST_REQUIRE:tc =3D "optee-test-tc.inc"
+
+require ${MACHINE_OPTEE_TEST_REQUIRE}
--=20
2.30.2


