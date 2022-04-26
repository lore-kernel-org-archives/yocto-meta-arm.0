Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA02C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5781.1650976462405293958
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DF4D23A;
	Tue, 26 Apr 2022 05:34:21 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE2263F774;
	Tue, 26 Apr 2022 05:34:20 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH honister 3/9] runfvp: handle the fvp quitting before we kill
 it
Date: Tue, 26 Apr 2022 13:33:53 +0100
Message-Id: <20220426123359.22873-4-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3304

From: Ross Burton <ross.burton@arm.com>

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
 
     if await fvp_process.wait() != 0:
         logger.info(f"{cli[0]} quit with code {fvp_process.returncode}")
-- 
2.17.1


