Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EA3C4332F
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 17:13:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7999.1640020421713115514
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 09:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57C3CED1
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 033273F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] runfvp: don't hide output when using terminals
Date: Mon, 20 Dec 2021 17:13:34 +0000
Message-Id: <20211220171337.877288-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220171337.877288-1-ross.burton@arm.com>
References: <20211220171337.877288-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 17:13:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2745

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
         loop =3D asyncio.get_event_loop()
-        loop.run_until_complete(asyncio.gather(start_fvp(cli, console_cb=
=3Dconsole_started)))
+        console_cb =3D expected_terminal and console_started or None
+        loop.run_until_complete(asyncio.gather(start_fvp(cli, console_cb=
=3Dconsole_cb)))
     except asyncio.CancelledError:
         pass
=20
--=20
2.25.1


