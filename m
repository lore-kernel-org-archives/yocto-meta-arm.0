Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A8EC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 13:11:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8275.1659532253389786851
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 06:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C8C411FB;
	Wed,  3 Aug 2022 06:10:53 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.84.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76FB3F70D;
	Wed,  3 Aug 2022 06:10:51 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	Robbie.Cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] runfvp: Stop the FVP when telnet shuts down cleanly
Date: Wed,  3 Aug 2022 14:10:13 +0100
Message-Id: <20220803131013.3769839-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Aug 2022 13:11:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3636

From: Peter Hoyes <Peter.Hoyes@arm.com>

At the moment, when using the --console flag, if telnet is shut down
cleanly (i.e. by typing "quit" at the prompt instead of Ctrl+C), runfvp
still waits on the FVP to exit of its own accord, so hangs.

Move the fvp.run() call so that when telnet quits, it immediately
proceeds to shut down the FVP.

Issue-Id: SCM-4954
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I2169c99586a1eebc2c6ab4b2e15fb0c769fc81a8
---
 scripts/runfvp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 9fb77d3..c5a74b2 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -64,8 +64,8 @@ async def start_fvp(args, config, extra_args):
             logger.debug(f"Telnet quit, cancelling tasks")
         else:
             fvp.add_line_callback(lambda line: print(line))
+            await fvp.run()
=20
-        await fvp.run()
     finally:
         await fvp.stop()
=20
--=20
2.25.1


