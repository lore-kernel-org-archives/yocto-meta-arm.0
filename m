Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D99DC43217
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 15:01:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6580.1668524501535484776
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 07:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83EF213D5;
	Tue, 15 Nov 2022 07:01:47 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4BD73F587;
	Tue, 15 Nov 2022 07:01:40 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 5/5] runfvp: Fix verbose output when using --console
Date: Tue, 15 Nov 2022 15:01:16 +0000
Message-Id: <20221115150116.314729-5-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115150116.314729-1-peter.hoyes@arm.com>
References: <20221115150116.314729-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 15:01:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4133

From: Peter Hoyes <Peter.Hoyes@arm.com>

Start a new thread to simultaneously log the output of FVP and the
telnet output if the --verbose flag is passed to runfvp. So that
ConsolePortParser can read the same stream, use itertools.tee to
temporarily duplicate the stream.

Use a custom log format string with an escape character to ensure that
log output always starts at the beginning of a line when interleaved
with console output.

Issue-Id: SCM-5314
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I3e815d9d899425e0d2af619524f09f2eda87562c
---
 scripts/runfvp | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 454acb86..939352b5 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -1,9 +1,11 @@
 #! /usr/bin/env python3
=20
+import itertools
 import os
 import pathlib
 import signal
 import sys
+import threading
=20
 import logging
 logger =3D logging.getLogger("RunFVP")
@@ -36,7 +38,8 @@ def parse_args(arguments):
         fvp_args =3D []
=20
     args =3D parser.parse_args(args=3Darguments)
-    logging.basicConfig(level=3Dargs.verbose and logging.DEBUG or loggin=
g.WARNING)
+    logging.basicConfig(level=3Dargs.verbose and logging.DEBUG or loggin=
g.WARNING,
+                        format=3D'\033[G%(levelname)s: %(message)s')
=20
     # If we're hooking up the console, don't start any terminals
     if args.console:
@@ -56,8 +59,17 @@ def start_fvp(args, config, extra_args):
             if not expected_terminal:
                 logger.error("--console used but FVP_CONSOLE not set in =
machine configuration")
                 return 1
-            parser =3D runner.ConsolePortParser(fvp.stdout)
+            port_stdout, log_stdout =3D itertools.tee(fvp.stdout, 2)
+            parser =3D runner.ConsolePortParser(port_stdout)
             port =3D parser.parse_port(expected_terminal)
+
+            def debug_log():
+                for line in log_stdout:
+                    line =3D line.strip().decode(errors=3D'ignore')
+                    logger.debug(f'FVP output: {line}')
+            log_thread =3D threading.Thread(None, debug_log)
+            log_thread.start()
+
             telnet =3D fvp.create_telnet(port)
             telnet.wait()
             logger.debug(f"Telnet quit, cancelling tasks")
--=20
2.25.1


