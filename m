Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77592C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5658.1650976469374213286
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E69E823A;
	Tue, 26 Apr 2022 05:34:28 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 220AD3F774;
	Tue, 26 Apr 2022 05:34:28 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH honister 7/9] runfvp: fix undefined variable in terminal
 selection login
Date: Tue, 26 Apr 2022 13:33:57 +0100
Message-Id: <20220426123359.22873-8-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3308

From: Ross Burton <ross.burton@arm.com>

Since 10e60cc the terminal_map doesn't exist, this piece of code wasn't
updated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runfvp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index ca1e797c..c20455fd 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -182,7 +182,7 @@ def parse_config(args, config):
             # TODO if raw mode
             # cli.extend(["--parameter", f"{terminal}.mode=raw"])
             # TODO put name into terminal title
-            cli.extend(["--parameter", f"{terminal}.terminal_command={terminal_map[args.terminals]}"])
+            cli.extend(["--parameter", f"{terminal}.terminal_command={terminals[args.terminals].command}"])
         else:
             # Disable terminal
             cli.extend(["--parameter", f"{terminal}.start_telnet=0"])
-- 
2.17.1


