Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64784C433FE
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 13:25:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9297.1634304323324756889
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 Oct 2021 06:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25C2D14BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 15 Oct 2021 06:25:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45FE3F694
	for <meta-arm@lists.yoctoproject.org>; Fri, 15 Oct 2021 06:25:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] runfvp: use asyncio instead of selector
Date: Fri, 15 Oct 2021 14:25:19 +0100
Message-Id: <20211015132519.1449833-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015132519.1449833-1-ross.burton@arm.com>
References: <20211015132519.1449833-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 15 Oct 2021 13:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2272

Using asyncio makes the code easier to understand.  Also start to expose
a callback for when consoles are opened.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 71 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index e9654268..a5a436e8 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -1,7 +1,9 @@
 #! /usr/bin/env python3
=20
+import asyncio
 import json
 import os
+import re
 import sys
 import subprocess
 import pathlib
@@ -153,6 +155,34 @@ def parse_config(args, config):
=20
     return cli
=20
+async def start_fvp(cli, console_cb):
+    try:
+        fvp_process =3D await asyncio.create_subprocess_exec(*cli, stdin=
=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDO=
UT)
+
+        async for line in fvp_process.stdout:
+            line =3D line.strip().decode("utf-8", errors=3D"replace")
+            if console_cb:
+                logger.debug(f"FVP output: {line}")
+            else:
+                print(line)
+
+            # Look for serial connections opening
+            if console_cb:
+                m =3D re.match(fr"^(\S+): Listening for serial connectio=
n on port (\d+)$", line)
+                if m:
+                    terminal =3D m.group(1)
+                    port =3D int(m.group(2))
+                    logger.debug(f"Console for {terminal} started on por=
t {port}")
+                    # When we can assume Py3.7+, this can be create_task
+                    asyncio.ensure_future(console_cb(terminal, port))
+    finally:
+        # If we get cancelled or throw an exception, kill the FVP
+        logger.debug(f"Killing FVP PID {fvp_process.pid}")
+        fvp_process.terminate()
+
+    if await fvp_process.wait() !=3D 0:
+        logger.info(f"{cli[0]} quit with code {fvp_process.returncode}")
+
 def runfvp(cli_args):
     args, fvp_args =3D parse_args(cli_args)
     config_file =3D find_config(args)
@@ -166,31 +196,24 @@ def runfvp(cli_args):
         if not expected_terminal:
             logger.error("--console used but FVP_CONSOLE not set in mach=
ine configuration")
             sys.exit(1)
-
-        fvp_process =3D subprocess.Popen(cli, bufsize=3D1, universal_new=
lines=3DTrue, stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stder=
r=3Dsubprocess.STDOUT)
-
-        import selectors, re
-        selector =3D selectors.DefaultSelector()
-        selector.register(fvp_process.stdout, selectors.EVENT_READ)
-        output =3D ""
-        looking =3D True
-        while fvp_process.poll() is None:
-            # TODO some sort of timeout for 'input never appeared'
-            events =3D selector.select(timeout=3D10)
-            for key, mask in events:
-                line =3D key.fileobj.readline()
-                output +=3D line
-                if looking:
-                    m =3D re.match(fr"^{expected_terminal}: Listening.+p=
ort ([0-9]+)$", line)
-                    if m:
-                        port =3D m.group(1)
-                        subprocess.run(["telnet", "localhost", port])
-                        looking =3D False
-        if fvp_process.returncode:
-            logger.error(f"{fvp_process.args[0]} quit with code {fvp_pro=
cess.returncode}:")
-            logger.error(output)
     else:
-        sys.exit(subprocess.run(cli).returncode)
+        expected_terminal =3D None
+
+    async def console_started(name, port):
+        if name =3D=3D expected_terminal:
+            telnet =3D await asyncio.create_subprocess_exec("telnet", "l=
ocalhost", str(port), stdin=3Dsys.stdin, stdout=3Dsys.stdout)
+            await telnet.wait()
+            logger.debug(f"Telnet quit, cancelling tasks")
+            for t in asyncio.all_tasks():
+                logger.debug(f"Cancelling {t}")
+                t.cancel()
+
+    try:
+        # When we can assume Py3.7+, this can simply be asyncio.run()
+        loop =3D asyncio.get_event_loop()
+        loop.run_until_complete(asyncio.gather(start_fvp(cli, console_cb=
=3Dconsole_started)))
+    except asyncio.CancelledError:
+        pass
=20
 if __name__ =3D=3D "__main__":
     try:
--=20
2.25.1


