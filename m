Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15345C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 15:44:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.36207.1701186290617067100
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 07:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4C3FC15;
	Tue, 28 Nov 2023 07:45:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE7573F6C4;
	Tue, 28 Nov 2023 07:44:48 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] meta-arm/selftest: add test that PAC/BTI instructions are used
Date: Tue, 28 Nov 2023 15:44:47 +0000
Message-Id: <20231128154447.2616762-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Nov 2023 15:44:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5284

From: Ross Burton <ross.burton@arm.com>

We enable PAC/BTI out of the box, but all of the pieces (such as gcc and
glibc) need to support it for the final binary to be protected.

Add a minimal test recipe to verify that the "Hello, World" binary is
using PAC/BTI, and add it to oe-selftest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/selftest/cases/pacbti.py  | 11 +++++++++++
 meta-arm/recipes-test/pacbti/files/pacbti.c |  9 +++++++++
 meta-arm/recipes-test/pacbti/test-pacbti.bb | 21 +++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 meta-arm/lib/oeqa/selftest/cases/pacbti.py
 create mode 100644 meta-arm/recipes-test/pacbti/files/pacbti.c
 create mode 100644 meta-arm/recipes-test/pacbti/test-pacbti.bb

diff --git a/meta-arm/lib/oeqa/selftest/cases/pacbti.py b/meta-arm/lib/oe=
qa/selftest/cases/pacbti.py
new file mode 100644
index 00000000..40fe5e13
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/pacbti.py
@@ -0,0 +1,11 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfNotArch
+from oeqa.utils.commands import bitbake
+
+@OETestTag("meta-arm")
+class PacBtiTest(OESelftestTestCase):
+
+    @skipIfNotArch(["aarch64"])
+    def test_pac_bti(self):
+        bitbake("test-pacbti")
diff --git a/meta-arm/recipes-test/pacbti/files/pacbti.c b/meta-arm/recip=
es-test/pacbti/files/pacbti.c
new file mode 100644
index 00000000..618354ea
--- /dev/null
+++ b/meta-arm/recipes-test/pacbti/files/pacbti.c
@@ -0,0 +1,9 @@
+// Copyright (C) 2023 Arm Ltd
+// SPDX-License-Identifier: MIT
+
+#include <stdio.h>
+
+int main() {
+    puts("Hello, world");
+    return 0;
+}
diff --git a/meta-arm/recipes-test/pacbti/test-pacbti.bb b/meta-arm/recip=
es-test/pacbti/test-pacbti.bb
new file mode 100644
index 00000000..331c5854
--- /dev/null
+++ b/meta-arm/recipes-test/pacbti/test-pacbti.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Test to verify that PAC/BTI is enabled"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://pacbti.c;beginline=3D2;endline=3D2;md5=3D6e=
c41034e04432ee375d0e14fba596f4"
+
+SRC_URI =3D "file://pacbti.c"
+
+S =3D "${WORKDIR}"
+
+do_compile() {
+    # Compile with -zforce-bti with fatal warnings, so the link fails if=
 PAC/BTI
+    # is requested but gcc/glibc are built without it.
+    ${CC} ${CFLAGS} ${LDFLAGS} -z force-bti -Werror -Wl,--fatal-warnings=
 ${S}/pacbti.c
+
+    # If we have a binary, check that the AArch64 feature list in the bi=
nary
+    # actually enables PAC/BTI.
+    ${READELF} --notes a.out | grep "AArch64 feature" >notes
+    grep BTI notes
+    grep PAC notes
+}
+
+COMPATIBLE_HOST =3D "aarch64.*-linux"
--=20
2.34.1


