Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70219C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 16:54:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12007.1647622466257171375
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 09:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0434A1515
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:54:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7D0E3F7B4
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:54:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/oeqa/fvp: show more log from the FVP on failure
Date: Fri, 18 Mar 2022 16:54:19 +0000
Message-Id: <20220318165422.1711512-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 16:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3185

If the FVP fails to boot, the last 20 lines may just be a stack trace.
Show the last 200 lines for further context.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 29ccae5f..7136a003 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -63,7 +63,8 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
                 return
         except asyncio.TimeoutError:
             self.logger.info("Timed out waiting for login prompt.")
-        self.logger.info(b"\n".join(bootlog.splitlines()[-20:]).decode("=
utf-8", errors=3D"replace"))
+        self.logger.info("Boot log follows:")
+        self.logger.info(b"\n".join(bootlog.splitlines()[-200:]).decode(=
"utf-8", errors=3D"replace"))
         raise RuntimeError("Failed to start FVP.")
=20
     def start(self, **kwargs):
--=20
2.25.1


