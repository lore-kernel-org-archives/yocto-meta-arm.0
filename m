Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B92C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 17:50:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2343.1715968224810882716
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 May 2024 10:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94BBE1424
	for <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 10:50:47 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BFAE3F762
	for <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 10:50:23 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm/oeqa: increase optee and ftpm test timeouts
Date: Fri, 17 May 2024 13:50:22 -0400
Message-Id: <20240517175022.48759-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 17:50:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5737

OPTEE and ftpm tests are failing in CI on slower systems due to timing
out, but actually finish when given enough time to complete.  Increase
the timeout value to be roughly 100 seconds longer than the time it is
currently taking to finish on the slower systems.

Fixes: d4507866677c ("oeqa runtime: add optee.py test")
Fixes: ba315f7242e0 ("oeqa runtime: add ftpm.py test")
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/ftpm.py  | 6 +++---
 meta-arm/lib/oeqa/runtime/cases/optee.py | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/ftpm.py b/meta-arm/lib/oeqa/=
runtime/cases/ftpm.py
index 1fd3cf882158..be0cf46f5b84 100644
--- a/meta-arm/lib/oeqa/runtime/cases/ftpm.py
+++ b/meta-arm/lib/oeqa/runtime/cases/ftpm.py
@@ -11,12 +11,12 @@ class FtpmTestSuite(OERuntimeTestCase):
     """
     Minimal test for optee-ftpm and ftpm kernel driver interfaces
     """
-    @OETimeout(200)
+    @OETimeout(360)
     def test_ftpm(self):
         # device files, need tee-supplicant fully initialized which take=
s some time
         # and tests seem to run before boot is complete
-        cmd =3D "ls -l /dev/tpm0 /dev/tpmrm0 || ( runlevel; sleep 10; ls=
 -l /dev/tpm0 /dev/tpmrm0 )"
-        status, output =3D self.target.run(cmd, timeout=3D60)
+        cmd =3D "ls -l /dev/tpm0 /dev/tpmrm0 || ( runlevel; sleep 60; ls=
 -l /dev/tpm0 /dev/tpmrm0 )"
+        status, output =3D self.target.run(cmd, timeout=3D90)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
=20
         # tpm version
diff --git a/meta-arm/lib/oeqa/runtime/cases/optee.py b/meta-arm/lib/oeqa=
/runtime/cases/optee.py
index 0a0bc31ed3d8..4f46225b1d74 100644
--- a/meta-arm/lib/oeqa/runtime/cases/optee.py
+++ b/meta-arm/lib/oeqa/runtime/cases/optee.py
@@ -12,7 +12,7 @@ class OpteeTestSuite(OERuntimeTestCase):
     """
     Run OP-TEE tests (xtest).
     """
-    @OETimeout(800)
+    @OETimeout(1300)
     @OEHasPackage(['optee-test'])
     def test_opteetest_xtest(self):
         # clear storage before executing tests
@@ -20,5 +20,5 @@ class OpteeTestSuite(OERuntimeTestCase):
         status, output =3D self.target.run(cmd, timeout=3D60)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
         cmd =3D "xtest"
-        status, output =3D self.target.run(cmd, timeout=3D600)
+        status, output =3D self.target.run(cmd, timeout=3D1200)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
--=20
2.39.3 (Apple Git-146)


