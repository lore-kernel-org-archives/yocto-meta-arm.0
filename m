Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735AEC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5613.1650976465544097175
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E19123A;
	Tue, 26 Apr 2022 05:34:25 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E52D3F774;
	Tue, 26 Apr 2022 05:34:24 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH honister 5/9] runfvp: don't use f-string when there's no
 expressions
Date: Tue, 26 Apr 2022 13:33:55 +0100
Message-Id: <20220426123359.22873-6-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3306

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 77668248..fb334795 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -169,7 +169,7 @@ async def start_fvp(cli, console_cb):
 
             # Look for serial connections opening
             if console_cb:
-                m = re.match(fr"^(\S+): Listening for serial connection on port (\d+)$", line)
+                m = re.match(r"^(\S+): Listening for serial connection on port (\d+)$", line)
                 if m:
                     terminal = m.group(1)
                     port = int(m.group(2))
-- 
2.17.1


