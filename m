Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB54C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 12:15:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26239.1658146512355827443
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 05:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AE6E1042;
	Mon, 18 Jul 2022 05:15:12 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D14E3F70D;
	Mon, 18 Jul 2022 05:15:11 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm/lib: Improve FVPRunner shutdown logic
Date: Mon, 18 Jul 2022 13:15:33 +0100
Message-Id: <20220718121533.3274181-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Jul 2022 12:15:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3564

From: Peter Hoyes <Peter.Hoyes@arm.com>

Please can this be applied to master + kirkstone.

We have encountered intermittent hanging during FVP shutdown, so improve
the termination logic by first issuing a terminate(), waiting a bit
then, if necessary, issuing a kill().

Move returncode logic to after the telnet/pexpect cleanup so it
actually runs.

Move pexpect.EOF logic into FVPRunner.stop so that it executes before
closing the pexpect handle.

Issue-Id: SCM-4957
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Iebb3c3c89367256b1e116e66ffdb6b742358bce4
---
 meta-arm/lib/fvp/runner.py           | 34 +++++++++++++++++++---------
 meta-arm/lib/oeqa/controllers/fvp.py |  6 -----
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 3b3fd00..7641cd6 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -72,24 +72,36 @@ class FVPRunner:
=20
     async def stop(self):
         if self._fvp_process:
-            self._logger.debug(f"Killing FVP PID {self._fvp_process.pid}=
")
+            self._logger.debug(f"Terminating FVP PID {self._fvp_process.=
pid}")
             try:
                 self._fvp_process.terminate()
+                await asyncio.wait_for(self._fvp_process.wait(), 10.0)
+            except asyncio.TimeoutError:
+                self._logger.debug(f"Killing FVP PID {self._fvp_process.=
pid}")
+                self._fvp_process.kill()
             except ProcessLookupError:
                 pass
=20
-            if await self._fvp_process.wait() !=3D 0:
-                self._logger.info(f"FVP quit with code {self._fvp_proces=
s.returncode}")
-                return self._fvp_process.returncode
-            else:
-                return 0
-
         for telnet in self._telnets:
-            await telnet.terminate()
-            await telnet.wait()
+            try:
+                telnet.terminate()
+                await asyncio.wait_for(telnet.wait(), 10.0)
+            except asyncio.TimeoutError:
+                telnet.kill()
+            except ProcessLookupError:
+                pass
+
+        for console in self._pexpects:
+            import pexpect
+            # Ensure pexpect logs all remaining output to the logfile
+            console.expect(pexpect.EOF, timeout=3D5.0)
+            console.close()
=20
-        for pexpect in self._pexpects:
-            pexpect.close()
+        if self._fvp_process and self._fvp_process.returncode:
+            self._logger.info(f"FVP quit with code {self._fvp_process.re=
turncode}")
+            return self._fvp_process.returncode
+        else:
+            return 0
=20
     async def run(self, until=3DNone):
         if until and until():
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 30b6296..c8dcf29 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -127,12 +127,6 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
                 default_test_file =3D f"{name}_log{self.test_log_suffix}=
"
                 os.symlink(default_test_file, self.bootlog)
=20
-    async def _after_stop(self):
-        # Ensure pexpect logs all remaining output to the logfile
-        for terminal in self.terminals.values():
-            terminal.expect(pexpect.EOF, timeout=3D5)
-            terminal.close()
-
     def _get_terminal(self, name):
         return self.terminals[name]
=20
--=20
2.25.1


