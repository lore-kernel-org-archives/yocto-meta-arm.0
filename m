Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B9CC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 12:15:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.27907.1664194534038935256
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 05:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5233D106F;
	Mon, 26 Sep 2022 05:15:40 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E1E3F3F73B;
	Mon, 26 Sep 2022 05:15:32 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/test: Adding a test app for external system
Date: Mon, 26 Sep 2022 13:15:20 +0100
Message-Id: <20220926121521.35674-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220926121521.35674-1-emekcan.aras@arm.com>
References: <20220926121521.35674-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 12:15:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3836

From: Emekcan <emekcan.aras@arm.com>

Adds a linux userspace test application and a recipe
to build it to test external system in corstone1000
platform.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../corstone1000-external-sys-tests_1.0.bb    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb

diff --git a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb
new file mode 100644
index 00000000..04c0aae2
--- /dev/null
+++ b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "CORSTONE1000 external systems communications tests"
+DESCRIPTION = "This is a Linux userspace tool to test the communication between Corstone1000 cores"
+HOMEPAGE = "https://git.linaro.org/landing-teams/working/arm/test-apps.git"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0"
+
+SRC_URI = "git://git.linaro.org/landing-teams/working/arm/test-apps.git;protocol=https;branch=master"
+SRCREV = "2945cd92f7c6dbe4999ee72cd5cf1e2615eedba7"
+PV .= "+git${SRCPV}"
+
+COMPATIBLE_MACHINE = "corstone1000"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S}/systems-comms-tests
+}
+
+do_install() {
+    install -D -p -m 0755 ${S}/systems-comms-tests ${D}${bindir}/systems-comms-tests
+}
-- 
2.17.1


