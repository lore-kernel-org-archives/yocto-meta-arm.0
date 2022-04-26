Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FDFC4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5537.1650976472959754295
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F774ED1;
	Tue, 26 Apr 2022 05:34:32 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D44FA3F774;
	Tue, 26 Apr 2022 05:34:31 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH honister 9/9] runfvp: check for telnet
Date: Tue, 26 Apr 2022 13:33:59 +0100
Message-Id: <20220426123359.22873-10-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3310

From: Ross Burton <ross.burton@arm.com>

Check for telnet on startup to avoid mysterious failures later when
telnet isn't available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runfvp | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 5cab0949..0ebf873e 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -5,6 +5,7 @@ import collections
 import json
 import os
 import re
+import shutil
 import signal
 import sys
 import subprocess
@@ -42,7 +43,7 @@ class Terminals:
         return config.get("RunFVP", "Terminal", fallback=None)
 
     def preferred_terminal(self) -> str:
-        import shlex, shutil
+        import shlex
 
         preferred = self.configured_terminal()
         if preferred:
@@ -233,6 +234,11 @@ def runfvp(cli_args):
     cli.extend(fvp_args)
     logger.debug(f"Constructed FVP call: {cli}")
 
+    # Check that telnet is present
+    if not bool(shutil.which("telnet")):
+        logger.error("Cannot find telnet, this is needed to connect to the FVP.")
+        return 1
+
     if args.console:
         expected_terminal = config["console"]
         if not expected_terminal:
-- 
2.17.1


