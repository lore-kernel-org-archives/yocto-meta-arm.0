Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E96C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 13:23:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15066.1715779376460083553
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 May 2024 06:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F2861042
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 May 2024 06:23:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FCA23F7A6
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 May 2024 06:22:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/oeqa/runtime/fvp_boot: move pexpect import into test method
Date: Wed, 15 May 2024 13:22:52 +0000
Message-Id: <20240515132252.3923595-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 May 2024 13:23:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5715

Move the pexpect import inside the test method so that on machines withou=
t
pexpect installed we can still parse the test cases, even if this one
won't be pass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/fvp_boot.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/fvp_boot.py b/meta-arm/lib/o=
eqa/runtime/cases/fvp_boot.py
index dce52776..342186eb 100644
--- a/meta-arm/lib/oeqa/runtime/cases/fvp_boot.py
+++ b/meta-arm/lib/oeqa/runtime/cases/fvp_boot.py
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: MIT
=20
 from oeqa.runtime.case import OERuntimeTestCase
-import pexpect
-
=20
 class FVPBootTest(OERuntimeTestCase):
     """
@@ -11,6 +9,8 @@ class FVPBootTest(OERuntimeTestCase):
     """
=20
     def test_fvp_boot(self):
+        import pexpect
+
         self.target.transition("off")
         timeout =3D int(self.td.get('TEST_FVP_LINUX_BOOT_TIMEOUT') or 10=
*60)
         self.target.transition("linux", timeout)
--=20
2.34.1


