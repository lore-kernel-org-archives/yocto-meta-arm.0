Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B8EC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 16:42:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.14356.1642783325487175386
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 08:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C520113E
	for <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 08:42:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3699A3F73D
	for <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 08:42:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/oeqa/fvp: fix scoping issues with the bootlog
Date: Fri, 21 Jan 2022 16:41:58 +0000
Message-Id: <20220121164159.3780055-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 16:42:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2892

If wait_for_login() times out then it raises an exception instead of
passing back return values, so the bootlog is never assigned.

We always want a boot log, so initialise it outside of wait_for_login and
pass it in.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 87e1b941..29ccae5f 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -39,13 +39,12 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
         self.fvp =3D await asyncio.create_subprocess_exec(*cmd, stdout=3D=
subprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIPE)
         self.logger.debug(f"Started runfvp PID {self.fvp.pid}")
=20
-        async def wait_for_login():
-            bootlog =3D bytearray()
+        async def wait_for_login(bootlog):
             while True:
                 line =3D await self.fvp.stdout.read(1024)
                 if not line:
                     self.logger.debug("runfvp terminated")
-                    return False, bootlog
+                    return False
=20
                 self.logger.debug(f"Read line [{line}]")
=20
@@ -55,11 +54,11 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
=20
                 if b" login:" in bootlog:
                     self.logger.debug("Found login prompt")
-                    return True, bootlog
-            return False, bootlog
+                    return True
=20
+        bootlog =3D bytearray()
         try:
-            found, bootlog =3D await asyncio.wait_for(wait_for_login(), =
self.boot_timeout)
+            found =3D await asyncio.wait_for(wait_for_login(bootlog), se=
lf.boot_timeout)
             if found:
                 return
         except asyncio.TimeoutError:
--=20
2.25.1


