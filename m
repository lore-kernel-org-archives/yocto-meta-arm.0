Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB32C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 14:50:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8756.1664376649053923605
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 07:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: davidson.kumaresan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 254DA23A;
	Wed, 28 Sep 2022 07:50:55 -0700 (PDT)
Received: from usa.arm.com (unknown [10.162.16.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B2EA3F73D;
	Wed, 28 Sep 2022 07:50:47 -0700 (PDT)
From: Davidson K <davidson.kumaresan@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 2/7] arm-bsp/test: Adding a test app for external system
Date: Wed, 28 Sep 2022 20:20:31 +0530
Message-Id: <20220928145036.47650-2-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928145036.47650-1-davidson.kumaresan@arm.com>
References: <20220928145036.47650-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 14:50:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3860

From: Emekcan <emekcan.aras@arm.com>

Adds a linux userspace test application and a recipe
to build it to test external system in corstone1000
platform.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../corstone1000-external-sys-tests_1.0.bb    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-test/corstone1000-external-sys-t=
ests/corstone1000-external-sys-tests_1.0.bb

diff --git a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/co=
rstone1000-external-sys-tests_1.0.bb b/meta-arm-bsp/recipes-test/corstone=
1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb
new file mode 100644
index 00000000..04c0aae2
--- /dev/null
+++ b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_1.0.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "CORSTONE1000 external systems communications tests"
+DESCRIPTION =3D "This is a Linux userspace tool to test the communicatio=
n between Corstone1000 cores"
+HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/test-apps=
.git"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0"
+
+SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/test-apps.gi=
t;protocol=3Dhttps;branch=3Dmaster"
+SRCREV =3D "2945cd92f7c6dbe4999ee72cd5cf1e2615eedba7"
+PV .=3D "+git${SRCPV}"
+
+COMPATIBLE_MACHINE =3D "corstone1000"
+
+S =3D "${WORKDIR}/git"
+
+do_compile() {
+    ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S}/systems-comms-tes=
ts
+}
+
+do_install() {
+    install -D -p -m 0755 ${S}/systems-comms-tests ${D}${bindir}/systems=
-comms-tests
+}
--=20
2.34.1


