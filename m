Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA36C4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5656.1650976463858165279
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78222ED1;
	Tue, 26 Apr 2022 05:34:23 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC0063F774;
	Tue, 26 Apr 2022 05:34:22 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH honister 4/9] runfvp: don't hide output when using terminals
Date: Tue, 26 Apr 2022 13:33:54 +0100
Message-Id: <20220426123359.22873-5-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3305

From: Ross Burton <ross.burton@arm.com>

Only pass a console_cb if we're hooking up a console, so that the output
from the FVP is visible on the terminal.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 877e80cb..77668248 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -216,7 +216,8 @@ def runfvp(cli_args):
     try:
         # When we can assume Py3.7+, this can simply be asyncio.run()
         loop = asyncio.get_event_loop()
-        loop.run_until_complete(asyncio.gather(start_fvp(cli, console_cb=console_started)))
+        console_cb = expected_terminal and console_started or None
+        loop.run_until_complete(asyncio.gather(start_fvp(cli, console_cb=console_cb)))
     except asyncio.CancelledError:
         pass
 
-- 
2.17.1


