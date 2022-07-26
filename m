Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2873FC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 15:35:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8253.1658849747646789303
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 08:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C77141FB;
	Tue, 26 Jul 2022 08:35:47 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A29A83F73B;
	Tue, 26 Jul 2022 08:35:46 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm/oeqa: Fix regex warning in linuxboot test case
Date: Tue, 26 Jul 2022 16:35:36 +0100
Message-Id: <20220726153536.3573383-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 15:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3590

From: Peter Hoyes <Peter.Hoyes@arm.com>

The linuxboot test case prints the following in log.do_testimage, only
when executing testimage without a pycache:

  linuxboot.py:18: DeprecationWarning: invalid escape sequence \:
    self.target.expect(self.console, "login\:", timeout=3D10*60)

Fix the warning by escaping the ':' character correctly in the pexpect
regex.

Issue-Id: SCM-4957
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I8ad54c7df6b7d1d1ddeab31cf66daff1ab84e227
---
 meta-arm/lib/oeqa/runtime/cases/linuxboot.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py b/meta-arm/lib/=
oeqa/runtime/cases/linuxboot.py
index 19e6e18..8994405 100644
--- a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
+++ b/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
@@ -15,4 +15,4 @@ class LinuxBootTest(OERuntimeTestCase):
=20
     def test_linux_boot(self):
         self.logger.info(f"{self.console}: Waiting for login prompt")
-        self.target.expect(self.console, "login\:", timeout=3D10*60)
+        self.target.expect(self.console, r"login\:", timeout=3D10*60)
--=20
2.25.1


