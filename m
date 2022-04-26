Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E87C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5536.1650976471196684265
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D454223A;
	Tue, 26 Apr 2022 05:34:30 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 164843F774;
	Tue, 26 Apr 2022 05:34:29 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH honister 8/9] runfvp: propagate the exit code correctly
Date: Tue, 26 Apr 2022 13:33:58 +0100
Message-Id: <20220426123359.22873-9-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3309

From: Ross Burton <ross.burton@arm.com>

runfvp could encounter an error but the exit code remained as 0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runfvp | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index c20455fd..5cab0949 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -221,6 +221,9 @@ async def start_fvp(cli, console_cb):
 
     if await fvp_process.wait() != 0:
         logger.info(f"{cli[0]} quit with code {fvp_process.returncode}")
+        return fvp_process.returncode
+    else:
+        return 0
 
 def runfvp(cli_args):
     args, fvp_args = parse_args(cli_args)
@@ -234,7 +237,7 @@ def runfvp(cli_args):
         expected_terminal = config["console"]
         if not expected_terminal:
             logger.error("--console used but FVP_CONSOLE not set in machine configuration")
-            sys.exit(1)
+            return 1
     else:
         expected_terminal = None
 
@@ -252,9 +255,10 @@ def runfvp(cli_args):
         # When we can assume Py3.7+, this can simply be asyncio.run()
         loop = asyncio.get_event_loop()
         console_cb = expected_terminal and console_started or None
-        loop.run_until_complete(asyncio.gather(start_fvp(cli, console_cb=console_cb)))
+        return loop.run_until_complete(start_fvp(cli, console_cb=console_cb))
     except asyncio.CancelledError:
-        pass
+        # This means telnet exited, which isn't an error
+        return 0
 
 if __name__ == "__main__":
     try:
@@ -264,6 +268,6 @@ if __name__ == "__main__":
         if sys.stdin.isatty():
             signal.signal(signal.SIGTTOU, signal.SIG_IGN)
             os.tcsetpgrp(sys.stdin.fileno(), os.getpgrp())
-        runfvp(sys.argv[1:])
+        sys.exit(runfvp(sys.argv[1:]))
     except KeyboardInterrupt:
         pass
-- 
2.17.1


