Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0816C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 17:33:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.316.1715103199420032386
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 May 2024 10:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2BA81063
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:44 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6ABF3F587
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:18 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm/oeqa: increase optee test timeout
Date: Tue,  7 May 2024 13:33:13 -0400
Message-Id: <20240507173313.50788-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240507173313.50788-1-jon.mason@arm.com>
References: <20240507173313.50788-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 May 2024 17:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5703

OPTEE tests are failing in CI on slower systems due to timing out, but
actually finish when given enough time to complete.  Increase the
timeout value to be roughly 100 seconds longer than the time it is
currently taking to finish on the slower systems.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/optee.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/optee.py b/meta-arm/lib/oeqa=
/runtime/cases/optee.py
index 0a0bc31ed3d8..73bb3894e106 100644
--- a/meta-arm/lib/oeqa/runtime/cases/optee.py
+++ b/meta-arm/lib/oeqa/runtime/cases/optee.py
@@ -12,7 +12,7 @@ class OpteeTestSuite(OERuntimeTestCase):
     """
     Run OP-TEE tests (xtest).
     """
-    @OETimeout(800)
+    @OETimeout(1100)
     @OEHasPackage(['optee-test'])
     def test_opteetest_xtest(self):
         # clear storage before executing tests
@@ -20,5 +20,5 @@ class OpteeTestSuite(OERuntimeTestCase):
         status, output =3D self.target.run(cmd, timeout=3D60)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
         cmd =3D "xtest"
-        status, output =3D self.target.run(cmd, timeout=3D600)
+        status, output =3D self.target.run(cmd, timeout=3D1000)
         self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
--=20
2.39.3 (Apple Git-146)


