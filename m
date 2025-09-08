Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88104CAC586
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 13:09:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12912.1757336961705548499
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 06:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C68DD1692
	for <meta-arm@lists.yoctoproject.org>; Mon,  8 Sep 2025 06:09:12 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 061103F63F
	for <meta-arm@lists.yoctoproject.org>; Mon,  8 Sep 2025 06:09:20 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/oeqa/optee.py: only run regression tests on qemu machines
Date: Mon,  8 Sep 2025 09:09:20 -0400
Message-Id: <20250908130920.98624-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Sep 2025 13:09:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6689

The OP-TEE default tests are taking over 30 minutes, which is causing CI
to overall take several hours.  For QEMU machines, reduce the tests to
just be the regression tests, which reduces the CI time by over 30%.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/optee.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/optee.py b/meta-arm/lib/oeqa=
/runtime/cases/optee.py
index 077eb6a47542..20354c530ea6 100644
--- a/meta-arm/lib/oeqa/runtime/cases/optee.py
+++ b/meta-arm/lib/oeqa/runtime/cases/optee.py
@@ -7,14 +7,17 @@ import os
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.decorator.oetimeout import OETimeout
+from oeqa.core.decorator.data import skipIfQemu
+from oeqa.core.decorator.data import skipIfNotQemu
=20
 class OpteeTestSuite(OERuntimeTestCase):
     """
     Run OP-TEE tests (xtest).
     """
+    @skipIfQemu()
     @OETimeout(2700)
     @OEHasPackage(['optee-test'])
-    def test_opteetest_xtest(self):
+    def test_opteetest_xtest_all(self):
         # clear storage before executing tests
         cmd =3D "xtest --clear-storage || true"
         status, output =3D self.target.run(cmd, timeout=3D60)
@@ -22,3 +25,15 @@ class OpteeTestSuite(OERuntimeTestCase):
         cmd =3D "xtest"
         status, output =3D self.target.run(cmd, timeout=3D1200)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
+
+    @skipIfNotQemu()
+    @OETimeout(2700)
+    @OEHasPackage(['optee-test'])
+    def test_opteetest_xtest_regression(self):
+        # clear storage before executing tests
+        cmd =3D "xtest --clear-storage || true"
+        status, output =3D self.target.run(cmd, timeout=3D60)
+        self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
+        cmd =3D "xtest -t regression"
+        status, output =3D self.target.run(cmd, timeout=3D1200)
+        self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
--=20
2.39.5 (Apple Git-154)


