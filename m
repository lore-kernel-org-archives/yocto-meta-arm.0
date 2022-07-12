Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC97CCA47C
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:28:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7534.1657621731985866493
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 03:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AA671596;
	Tue, 12 Jul 2022 03:28:52 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05B763F792;
	Tue, 12 Jul 2022 03:28:50 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/6] arm/oeqa: Refactor OEFVPTarget to use FVPRunner and
 pexpect
Date: Tue, 12 Jul 2022 11:28:27 +0100
Message-Id: <20220712102830.625090-4-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712102830.625090-1-peter.hoyes@arm.com>
References: <20220712102830.625090-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 10:28:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3557

From: Peter Hoyes <Peter.Hoyes@arm.com>

Refactor OEFVPTarget to use the FVPRunner in meta-arm/lib instead of
calling runfvp in a new process.

Use pexpect to wait for the login prompt instead of parsing the FVP
output manually.

This patch introduces a dependency on pexpect for the meta-arm test
targets. It is already in the Yocto host dependency list and the Kas
container image, but may need to be installed on development machines.

Issue-Id: SCM-4957
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I7200e958c5701d82493287d021936afcf2f2bac9
---
 meta-arm/lib/fvp/runner.py           | 10 ++++
 meta-arm/lib/oeqa/controllers/fvp.py | 75 +++++++---------------------
 2 files changed, 29 insertions(+), 56 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index e7983c6..74ebc02 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -51,6 +51,7 @@ class FVPRunner:
         self._logger =3D logger
         self._fvp_process =3D None
         self._telnets =3D []
+        self._pexpects =3D []
=20
     def add_line_callback(self, callback):
         self._line_callbacks.append(callback)
@@ -87,6 +88,9 @@ class FVPRunner:
             await telnet.terminate()
             await telnet.wait()
=20
+        for pexpect in self._pexpects:
+            pexpect.close()
+
     async def run(self, until=3DNone):
         if until and until():
             return
@@ -111,5 +115,11 @@ class FVPRunner:
         self._telnets.append(telnet)
         return telnet
=20
+    async def create_pexpect(self, terminal, timeout=3D15.0, **kwargs):
+        check_telnet()
+        import pexpect
+        port =3D await self._get_terminal_port(terminal, timeout)
+        return pexpect.spawn(f"telnet localhost {port}", **kwargs)
+
     def pid(self):
         return self._fvp_process.pid
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 2913f78..c0a87ba 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -1,16 +1,11 @@
 import asyncio
-import os
 import pathlib
-import signal
-import subprocess
+import pexpect
=20
 import oeqa.core.target.ssh
+from fvp import conffile, runner
=20
 class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
-
-    # meta-arm/scripts isn't on PATH, so work out where it is
-    metaarm =3D pathlib.Path(__file__).parents[4]
-
     def __init__(self, logger, target_ip, server_ip, timeout=3D300, user=
=3D'root',
                  port=3DNone, server_port=3D0, dir_image=3DNone, rootfs=3D=
None, bootlog=3DNone,
                  **kwargs):
@@ -29,45 +24,24 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
         self.logfile =3D bootlog and open(bootlog, "wb") or None
=20
     async def boot_fvp(self):
-        cmd =3D [OEFVPTarget.metaarm / "scripts" / "runfvp", "--console"=
, "--verbose", self.fvpconf]
-        # Python 3.7 needs the command items to be str
-        cmd =3D [str(c) for c in cmd]
-        self.logger.debug(f"Starting {cmd}")
-
-        # TODO: refactor runfvp so this can import it and directly hook =
to the
-        # console callback, then use telnetlib directly to access the co=
nsole.
-
-        # As we're using --console, telnet expects stdin to be readable =
too.
-        self.fvp =3D await asyncio.create_subprocess_exec(*cmd, stdout=3D=
subprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIPE)
-        self.logger.debug(f"Started runfvp PID {self.fvp.pid}")
-
-        async def wait_for_login(bootlog):
-            while True:
-                line =3D await self.fvp.stdout.read(1024)
-                if not line:
-                    self.logger.debug("runfvp terminated")
-                    return False
-
-                self.logger.debug(f"Read line [{line}]")
-
-                bootlog +=3D line
-                if self.logfile:
-                    self.logfile.write(line)
-
-                if b" login:" in bootlog:
-                    self.logger.debug("Found login prompt")
-                    return True
-
-        bootlog =3D bytearray()
+        config =3D conffile.load(self.fvpconf)
+        self.fvp =3D runner.FVPRunner(self.logger)
+        await self.fvp.start(config)
+        self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
+        console =3D await self.fvp.create_pexpect(config["console"])
         try:
-            found =3D await asyncio.wait_for(wait_for_login(bootlog), se=
lf.boot_timeout)
-            if found:
-                return
-        except asyncio.TimeoutError:
+            console.expect("login\:", timeout=3Dself.boot_timeout)
+            self.logger.debug("Found login prompt")
+        except pexpect.TIMEOUT:
             self.logger.info("Timed out waiting for login prompt.")
-        self.logger.info("Boot log follows:")
-        self.logger.info(b"\n".join(bootlog.splitlines()[-200:]).decode(=
"utf-8", errors=3D"replace"))
-        raise RuntimeError("Failed to start FVP.")
+            self.logger.info("Boot log follows:")
+            self.logger.info(b"\n".join(console.before.splitlines()[-200=
:]).decode("utf-8", errors=3D"replace"))
+            raise RuntimeError("Failed to start FVP.")
+
+    async def stop_fvp(self):
+        returncode =3D await self.fvp.stop()
+
+        self.logger.debug(f"Stopped FVP with return code {returncode}")
=20
     def start(self, **kwargs):
         # When we can assume Py3.7+, this can simply be asyncio.run()
@@ -76,15 +50,4 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
=20
     def stop(self, **kwargs):
         loop =3D asyncio.get_event_loop()
-
-        try:
-            # Kill the process group so that the telnet and FVP die too
-            gid =3D os.getpgid(self.fvp.pid)
-            self.logger.debug(f"Sending SIGTERM to {gid}")
-            os.killpg(gid, signal.SIGTERM)
-            loop.run_until_complete(asyncio.wait_for(self.fvp.wait(), 10=
))
-        except TimeoutError:
-            self.logger.debug(f"Timed out, sending SIGKILL to {gid}")
-            os.killpg(gid, signal.SIGKILL)
-        except ProcessLookupError:
-            return
+        loop.run_until_complete(asyncio.gather(self.stop_fvp()))
--=20
2.25.1


