Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61FCCEACFC
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 18:39:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89686.1727807947462473751
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 11:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DDC4367;
	Tue,  1 Oct 2024 11:39:37 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02F463F58B;
	Tue,  1 Oct 2024 11:39:06 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Forissier?= <jerome@forissier.org>
Subject: [PATCH 5/5] arm/oeqa/optee.py: increase timeout value from 22 to 45 minutes
Date: Tue,  1 Oct 2024 14:39:03 -0400
Message-Id: <20241001183903.13457-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241001183903.13457-1-jon.mason@arm.com>
References: <20241001183903.13457-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 18:39:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6160

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Tests are taking more time now and several devices are
timing out:

https://gitlab.com/jonmason00/meta-arm/-/pipelines/1467809227

qemuarm64-secureboot runs the test in 10 and
qemuarm-secureboot in 13 minutes.

Upstream optee CI shows xtest runs taking around 30 minutes on
slowest qemu machines:

https://github.com/OP-TEE/optee_os/actions/runs/10997530234?pr=3D7052

Guestimate limit to 45 minutes so that slowest and most loaded
machines could fit there too. optee xtest has internal test
specific timeouts so if something hangs it should be detected
earlier.

If these limits still cause issues, then we could disable some of
the longer running tests with "xtest -l" option. Default for
testing level is 1 but maybe 2 or 3 could be enough.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: J=C3=A9r=C3=B4me Forissier <jerome@forissier.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/optee.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/optee.py b/meta-arm/lib/oeqa=
/runtime/cases/optee.py
index 4f46225b1d74..077eb6a47542 100644
--- a/meta-arm/lib/oeqa/runtime/cases/optee.py
+++ b/meta-arm/lib/oeqa/runtime/cases/optee.py
@@ -12,7 +12,7 @@ class OpteeTestSuite(OERuntimeTestCase):
     """
     Run OP-TEE tests (xtest).
     """
-    @OETimeout(1300)
+    @OETimeout(2700)
     @OEHasPackage(['optee-test'])
     def test_opteetest_xtest(self):
         # clear storage before executing tests
--=20
2.39.5 (Apple Git-154)


