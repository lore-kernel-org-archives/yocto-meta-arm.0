Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B7EC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 16:42:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.14299.1642783325487952423
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 08:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DCE011B3
	for <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 08:42:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD90F3F73D
	for <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 08:42:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] runfvp: fix undefined variable in terminal selection
 login
Date: Fri, 21 Jan 2022 16:41:59 +0000
Message-Id: <20220121164159.3780055-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121164159.3780055-1-ross.burton@arm.com>
References: <20220121164159.3780055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 16:42:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2891

Since 10e60cc the terminal_map doesn't exist, this piece of code wasn't
updated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index ca1e797c..c20455fd 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -182,7 +182,7 @@ def parse_config(args, config):
             # TODO if raw mode
             # cli.extend(["--parameter", f"{terminal}.mode=3Draw"])
             # TODO put name into terminal title
-            cli.extend(["--parameter", f"{terminal}.terminal_command=3D{=
terminal_map[args.terminals]}"])
+            cli.extend(["--parameter", f"{terminal}.terminal_command=3D{=
terminals[args.terminals].command}"])
         else:
             # Disable terminal
             cli.extend(["--parameter", f"{terminal}.start_telnet=3D0"])
--=20
2.25.1


