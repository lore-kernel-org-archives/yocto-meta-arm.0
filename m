Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DE6C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 15:01:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6502.1668524495722025218
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 07:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A670D13D5;
	Tue, 15 Nov 2022 07:01:41 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC6B63F587;
	Tue, 15 Nov 2022 07:01:34 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/5] arm/lib: Factor out asyncio in FVPRunner
Date: Tue, 15 Nov 2022 15:01:13 +0000
Message-Id: <20221115150116.314729-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115150116.314729-1-peter.hoyes@arm.com>
References: <20221115150116.314729-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 15:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4130

From: Peter Hoyes <Peter.Hoyes@arm.com>

FVPRunner relies heavily on asyncio, despite there being very little
concurrent work happening. Additionally, while the runfvp entry point
starts an asyncio runner, it is not practical to have a single asyncio
runtime during testimage, which is fully synchronous.

Refactor to use subprocess.Popen and related functionality. The process
object has a similar interface to its async equivalent.

Cascade the API changes to runfvp and the test target classes.

Issue-Id: SCM-5314
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I3e7517e8bcbb3b93c41405d43dbd8bd24a9e7eb8
---
 meta-arm/lib/fvp/runner.py                 | 35 +++++++++---------
 meta-arm/lib/oeqa/controllers/fvp.py       | 41 +++++++---------------
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 16 ++++-----
 scripts/runfvp                             | 23 +++++-------
 4 files changed, 46 insertions(+), 69 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index f5c61f8b..9b537e27 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -1,4 +1,3 @@
-import asyncio
 import re
 import subprocess
 import os
@@ -57,7 +56,7 @@ class FVPRunner:
     def add_line_callback(self, callback):
         self._line_callbacks.append(callback)
=20
-    async def start(self, config, extra_args=3D[], terminal_choice=3D"no=
ne"):
+    def start(self, config, extra_args=3D[], terminal_choice=3D"none"):
         cli =3D cli_from_config(config, terminal_choice)
         cli +=3D extra_args
=20
@@ -69,8 +68,8 @@ class FVPRunner:
                 env[name] =3D os.environ[name]
=20
         self._logger.debug(f"Constructed FVP call: {shlex.join(cli)}")
-        self._fvp_process =3D await asyncio.create_subprocess_exec(
-            *cli,
+        self._fvp_process =3D subprocess.Popen(
+            cli,
             stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.STDOUT,
             env=3Denv)
=20
@@ -82,13 +81,13 @@ class FVPRunner:
                 self._terminal_ports[terminal] =3D port
         self.add_line_callback(detect_terminals)
=20
-    async def stop(self):
+    def stop(self):
         if self._fvp_process:
             self._logger.debug(f"Terminating FVP PID {self._fvp_process.=
pid}")
             try:
                 self._fvp_process.terminate()
-                await asyncio.wait_for(self._fvp_process.wait(), 10.0)
-            except asyncio.TimeoutError:
+                self._fvp_process.wait(10.0)
+            except subprocess.TimeoutExpired:
                 self._logger.debug(f"Killing FVP PID {self._fvp_process.=
pid}")
                 self._fvp_process.kill()
             except ProcessLookupError:
@@ -97,8 +96,8 @@ class FVPRunner:
         for telnet in self._telnets:
             try:
                 telnet.terminate()
-                await asyncio.wait_for(telnet.wait(), 10.0)
-            except asyncio.TimeoutError:
+                telnet.wait(10.0)
+            except subprocess.TimeoutExpired:
                 telnet.kill()
             except ProcessLookupError:
                 pass
@@ -118,34 +117,34 @@ class FVPRunner:
         else:
             return 0
=20
-    async def run(self, until=3DNone):
+    def run(self, until=3DNone):
         if until and until():
             return
=20
-        async for line in self._fvp_process.stdout:
+        for line in self._fvp_process.stdout:
             line =3D line.strip().decode("utf-8", errors=3D"replace")
             for callback in self._line_callbacks:
                 callback(line)
             if until and until():
                 return
=20
-    async def _get_terminal_port(self, terminal, timeout):
+    def _get_terminal_port(self, terminal):
         def terminal_exists():
             return terminal in self._terminal_ports
-        await asyncio.wait_for(self.run(terminal_exists), timeout)
+        self.run(terminal_exists)
         return self._terminal_ports[terminal]
=20
-    async def create_telnet(self, terminal, timeout=3D15.0):
+    def create_telnet(self, terminal):
         check_telnet()
-        port =3D await self._get_terminal_port(terminal, timeout)
-        telnet =3D await asyncio.create_subprocess_exec("telnet", "local=
host", str(port), stdin=3Dsys.stdin, stdout=3Dsys.stdout)
+        port =3D self._get_terminal_port(terminal)
+        telnet =3D subprocess.Popen(["telnet", "localhost", str(port)], =
stdin=3Dsys.stdin, stdout=3Dsys.stdout)
         self._telnets.append(telnet)
         return telnet
=20
-    async def create_pexpect(self, terminal, timeout=3D15.0, **kwargs):
+    def create_pexpect(self, terminal, **kwargs):
         check_telnet()
         import pexpect
-        port =3D await self._get_terminal_port(terminal, timeout)
+        port =3D self._get_terminal_port(terminal)
         instance =3D pexpect.spawn(f"telnet localhost {port}", **kwargs)
         self._pexpects.append(instance)
         return instance
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index c8dcf298..dfc2b88b 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -1,4 +1,3 @@
-import asyncio
 import pathlib
 import pexpect
 import os
@@ -25,32 +24,18 @@ class OEFVPSSHTarget(OESSHTarget):
         if not self.fvpconf.exists():
             raise FileNotFoundError(f"Cannot find {self.fvpconf}")
=20
-    async def boot_fvp(self):
-        self.fvp =3D runner.FVPRunner(self.logger)
-        await self.fvp.start(self.config)
-        self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
-        await self._after_start()
-
-    async def _after_start(self):
+    def _after_start(self):
         pass
=20
-    async def _after_stop(self):
-        pass
-
-    async def stop_fvp(self):
-        returncode =3D await self.fvp.stop()
-        await self._after_stop()
-
-        self.logger.debug(f"Stopped FVP with return code {returncode}")
-
     def start(self, **kwargs):
-        # When we can assume Py3.7+, this can simply be asyncio.run()
-        loop =3D asyncio.get_event_loop()
-        loop.run_until_complete(asyncio.gather(self.boot_fvp()))
+        self.fvp =3D runner.FVPRunner(self.logger)
+        self.fvp.start(self.config)
+        self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
+        self._after_start()
=20
     def stop(self, **kwargs):
-        loop =3D asyncio.get_event_loop()
-        loop.run_until_complete(asyncio.gather(self.stop_fvp()))
+        returncode =3D self.fvp.stop()
+        self.logger.debug(f"Stopped FVP with return code {returncode}")
=20
=20
 class OEFVPTarget(OEFVPSSHTarget):
@@ -66,9 +51,9 @@ class OEFVPTarget(OEFVPSSHTarget):
         # FVPs boot slowly, so allow ten minutes
         self.boot_timeout =3D 10 * 60
=20
-    async def _after_start(self):
+    def _after_start(self):
         self.logger.debug(f"Awaiting console on terminal {self.config['c=
onsoles']['default']}")
-        console =3D await self.fvp.create_pexpect(self.config['consoles'=
]['default'])
+        console =3D self.fvp.create_pexpect(self.config['consoles']['def=
ault'])
         try:
             console.expect("login\\:", timeout=3Dself.boot_timeout)
             self.logger.debug("Found login prompt")
@@ -100,11 +85,11 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
         self.test_log_suffix =3D pathlib.Path(bootlog).suffix
         self.bootlog =3D bootlog
=20
-    async def _add_terminal(self, name, fvp_name):
+    def _add_terminal(self, name, fvp_name):
         logfile =3D self._create_logfile(name)
         self.logger.info(f'Creating terminal {name} on {fvp_name}')
         self.terminals[name] =3D \
-            await self.fvp.create_pexpect(fvp_name, logfile=3Dlogfile)
+            self.fvp.create_pexpect(fvp_name, logfile=3Dlogfile)
=20
     def _create_logfile(self, name):
         fvp_log_file =3D f"{name}_log{self.test_log_suffix}"
@@ -117,9 +102,9 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
         os.symlink(fvp_log_file, fvp_log_symlink)
         return open(fvp_log_path, 'wb')
=20
-    async def _after_start(self):
+    def _after_start(self):
         for name, console in self.config["consoles"].items():
-            await self._add_terminal(name, console)
+            self._add_terminal(name, console)
=20
             # testimage.bbclass expects to see a log file at `bootlog`,
             # so make a symlink to the 'default' log file
diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
index cf8a3c53..5cc8660f 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -81,13 +81,13 @@ class ConfFileTests(OESelftestTestCase):
=20
 class RunnerTests(OESelftestTestCase):
     def create_mock(self):
-        return unittest.mock.patch("asyncio.create_subprocess_exec")
+        return unittest.mock.patch("subprocess.Popen")
=20
     def test_start(self):
         from fvp import runner
         with self.create_mock() as m:
             fvp =3D runner.FVPRunner(self.logger)
-            asyncio.run(fvp.start({
+            fvp.start({
                 "fvp-bindir": "/usr/bin",
                 "exe": "FVP_Binary",
                 "parameters": {'foo': 'bar'},
@@ -96,13 +96,13 @@ class RunnerTests(OESelftestTestCase):
                 "terminals": {},
                 "args": ['--extra-arg'],
                 "env": {"FOO": "BAR"}
-            }))
+            })
=20
-            m.assert_called_once_with('/usr/bin/FVP_Binary',
+            m.assert_called_once_with(['/usr/bin/FVP_Binary',
                 '--parameter', 'foo=3Dbar',
                 '--data', 'data1',
                 '--application', 'a1=3Dfile',
-                '--extra-arg',
+                '--extra-arg'],
                 stdin=3Dunittest.mock.ANY,
                 stdout=3Dunittest.mock.ANY,
                 stderr=3Dunittest.mock.ANY,
@@ -113,7 +113,7 @@ class RunnerTests(OESelftestTestCase):
         from fvp import runner
         with self.create_mock() as m:
             fvp =3D runner.FVPRunner(self.logger)
-            asyncio.run(fvp.start({
+            fvp.start({
                 "fvp-bindir": "/usr/bin",
                 "exe": "FVP_Binary",
                 "parameters": {},
@@ -122,9 +122,9 @@ class RunnerTests(OESelftestTestCase):
                 "terminals": {},
                 "args": [],
                 "env": {"FOO": "BAR"}
-            }))
+            })
=20
-            m.assert_called_once_with('/usr/bin/FVP_Binary',
+            m.assert_called_once_with(['/usr/bin/FVP_Binary'],
                 stdin=3Dunittest.mock.ANY,
                 stdout=3Dunittest.mock.ANY,
                 stderr=3Dunittest.mock.ANY,
diff --git a/scripts/runfvp b/scripts/runfvp
index c5a74b2f..727223ca 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -1,6 +1,5 @@
 #! /usr/bin/env python3
=20
-import asyncio
 import os
 import pathlib
 import signal
@@ -47,11 +46,10 @@ def parse_args(arguments):
     logger.debug(f"FVP arguments: {fvp_args}")
     return args, fvp_args
=20
-
-async def start_fvp(args, config, extra_args):
+def start_fvp(args, config, extra_args):
     fvp =3D runner.FVPRunner(logger)
     try:
-        await fvp.start(config, extra_args, args.terminals)
+        fvp.start(config, extra_args, args.terminals)
=20
         if args.console:
             fvp.add_line_callback(lambda line: logger.debug(f"FVP output=
: {line}"))
@@ -59,15 +57,16 @@ async def start_fvp(args, config, extra_args):
             if not expected_terminal:
                 logger.error("--console used but FVP_CONSOLE not set in =
machine configuration")
                 return 1
-            telnet =3D await fvp.create_telnet(expected_terminal)
-            await telnet.wait()
+            telnet =3D fvp.create_telnet(expected_terminal)
+            telnet.wait()
             logger.debug(f"Telnet quit, cancelling tasks")
         else:
             fvp.add_line_callback(lambda line: print(line))
-            await fvp.run()
+            fvp.run()
=20
     finally:
-        await fvp.stop()
+        fvp.stop()
+
=20
 def runfvp(cli_args):
     args, extra_args =3D parse_args(cli_args)
@@ -77,14 +76,8 @@ def runfvp(cli_args):
         config_file =3D conffile.find(args.config)
     logger.debug(f"Loading {config_file}")
     config =3D conffile.load(config_file)
+    start_fvp(args, config, extra_args)
=20
-    try:
-        # When we can assume Py3.7+, this can simply be asyncio.run()
-        loop =3D asyncio.get_event_loop()
-        return loop.run_until_complete(start_fvp(args, config, extra_arg=
s))
-    except asyncio.CancelledError:
-        # This means telnet exited, which isn't an error
-        return 0
=20
 if __name__ =3D=3D "__main__":
     try:
--=20
2.25.1


