Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05865C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 17:13:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7944.1640020421275000180
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 09:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFDE41042
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B5293F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] runfvp: handle the fvp quitting before we kill it
Date: Mon, 20 Dec 2021 17:13:33 +0000
Message-Id: <20211220171337.877288-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220171337.877288-1-ross.burton@arm.com>
References: <20211220171337.877288-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 17:13:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2744

Don't raise an exception if the FVP has quit before we get around to
killing it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 524de24d..877e80cb 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -179,7 +179,10 @@ async def start_fvp(cli, console_cb):
     finally:
         # If we get cancelled or throw an exception, kill the FVP
         logger.debug(f"Killing FVP PID {fvp_process.pid}")
-        fvp_process.terminate()
+        try:
+            fvp_process.terminate()
+        except ProcessLookupError:
+            pass
=20
     if await fvp_process.wait() !=3D 0:
         logger.info(f"{cli[0]} quit with code {fvp_process.returncode}")
--=20
2.25.1


