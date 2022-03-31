Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A9BC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:31:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.749.1648751481282267781
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE58139F
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BA4A3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] runfvp: propagate the exit code correctly
Date: Thu, 31 Mar 2022 19:31:11 +0100
Message-Id: <20220331183117.22389-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3217

runfvp could encounter an error but the exit code remained as 0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index c20455fd..5cab0949 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -221,6 +221,9 @@ async def start_fvp(cli, console_cb):
=20
     if await fvp_process.wait() !=3D 0:
         logger.info(f"{cli[0]} quit with code {fvp_process.returncode}")
+        return fvp_process.returncode
+    else:
+        return 0
=20
 def runfvp(cli_args):
     args, fvp_args =3D parse_args(cli_args)
@@ -234,7 +237,7 @@ def runfvp(cli_args):
         expected_terminal =3D config["console"]
         if not expected_terminal:
             logger.error("--console used but FVP_CONSOLE not set in mach=
ine configuration")
-            sys.exit(1)
+            return 1
     else:
         expected_terminal =3D None
=20
@@ -252,9 +255,10 @@ def runfvp(cli_args):
         # When we can assume Py3.7+, this can simply be asyncio.run()
         loop =3D asyncio.get_event_loop()
         console_cb =3D expected_terminal and console_started or None
-        loop.run_until_complete(asyncio.gather(start_fvp(cli, console_cb=
=3Dconsole_cb)))
+        return loop.run_until_complete(start_fvp(cli, console_cb=3Dconso=
le_cb))
     except asyncio.CancelledError:
-        pass
+        # This means telnet exited, which isn't an error
+        return 0
=20
 if __name__ =3D=3D "__main__":
     try:
@@ -264,6 +268,6 @@ if __name__ =3D=3D "__main__":
         if sys.stdin.isatty():
             signal.signal(signal.SIGTTOU, signal.SIG_IGN)
             os.tcsetpgrp(sys.stdin.fileno(), os.getpgrp())
-        runfvp(sys.argv[1:])
+        sys.exit(runfvp(sys.argv[1:]))
     except KeyboardInterrupt:
         pass
--=20
2.25.1


