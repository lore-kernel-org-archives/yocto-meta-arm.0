Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB42C433FE
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 13:01:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31673.1635166884845612173
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 06:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3395D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 06:01:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D43D3F882
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 06:01:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/oeqa/fvp: handle the FVP process exiting
Date: Mon, 25 Oct 2021 14:01:21 +0100
Message-Id: <20211025130121.2040759-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 13:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2293

If the FVP has already quit when we're stopping an exception is raised,
so catch that and do nothing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 1e26a519..79d2f2ef 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -75,13 +75,14 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
     def stop(self, **kwargs):
         loop =3D asyncio.get_event_loop()
=20
-        # Kill the process group so that the telnet and FVP die too
-        gid =3D os.getpgid(self.fvp.pid)
-
         try:
+            # Kill the process group so that the telnet and FVP die too
+            gid =3D os.getpgid(self.fvp.pid)
             self.logger.debug(f"Sending SIGTERM to {gid}")
             os.killpg(gid, signal.SIGTERM)
             loop.run_until_complete(asyncio.wait_for(self.fvp.wait(), 10=
))
         except TimeoutError:
             self.logger.debug(f"Timed out, sending SIGKILL to {gid}")
             os.killpg(gid, signal.SIGKILL)
+        except ProcessLookupError:
+            return
--=20
2.25.1


