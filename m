Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06630C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 17:13:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7874.1640020421166020451
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 09:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EE97D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 495E03F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm/oeqa/fvp: wrap bootlog output correctly
Date: Mon, 20 Dec 2021 17:13:31 +0000
Message-Id: <20211220171337.877288-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 17:13:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2743

Join the list of boot log lines with newlines, so it displays properly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 79d2f2ef..87e1b941 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -64,7 +64,7 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
                 return
         except asyncio.TimeoutError:
             self.logger.info("Timed out waiting for login prompt.")
-        self.logger.info(b"".join(bootlog.splitlines()[-20:]).decode("ut=
f-8", errors=3D"replace"))
+        self.logger.info(b"\n".join(bootlog.splitlines()[-20:]).decode("=
utf-8", errors=3D"replace"))
         raise RuntimeError("Failed to start FVP.")
=20
     def start(self, **kwargs):
--=20
2.25.1


