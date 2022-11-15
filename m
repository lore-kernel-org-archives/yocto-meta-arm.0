Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42038C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 15:01:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6503.1668524497317902423
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 07:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 129CC1477;
	Tue, 15 Nov 2022 07:01:43 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 536113F587;
	Tue, 15 Nov 2022 07:01:36 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/5] arm/lib: Decouple console parsing from the FVPRunner
Date: Tue, 15 Nov 2022 15:01:14 +0000
Message-Id: <20221115150116.314729-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115150116.314729-1-peter.hoyes@arm.com>
References: <20221115150116.314729-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 15:01:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4131

From: Peter Hoyes <Peter.Hoyes@arm.com>

To simplify the FVPRunner class, create a separate ConsolePortParser
class to handle reading an iterator of lines and parsing port numbers
for FVP consoles. Use this in runfvp and the test targets.

This refactor also allows the stream being monitored to be changed more
easily, e.g. to a log file.

Issue-Id: SCM-5314
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Iade3a4c803fb355b04af7afa298d0a41fe707d94
---
 meta-arm/lib/fvp/runner.py           | 66 ++++++++++++++--------------
 meta-arm/lib/oeqa/controllers/fvp.py | 17 +++----
 scripts/runfvp                       |  9 ++--
 3 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 9b537e27..5c5ded28 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -44,18 +44,39 @@ def check_telnet():
     if not bool(shutil.which("telnet")):
         raise RuntimeError("Cannot find telnet, this is needed to connec=
t to the FVP.")
=20
+
+class ConsolePortParser:
+    def __init__(self, lines):
+        self._lines =3D lines
+        self._console_ports =3D {}
+
+    def parse_port(self, console):
+        if console in self._console_ports:
+            return self._console_ports[console]
+
+        while True:
+            try:
+                line =3D next(self._lines).strip().decode(errors=3D'igno=
re')
+                m =3D re.match(r"^(\S+): Listening for serial connection=
 on port (\d+)$", line)
+                if m:
+                    matched_console =3D m.group(1)
+                    matched_port =3D int(m.group(2))
+                    if matched_console =3D=3D console:
+                        return matched_port
+                    else:
+                        self._console_ports[matched_console] =3D matched=
_port
+            except StopIteration:
+                # self._lines might be a growing log file
+                pass
+
+
 class FVPRunner:
     def __init__(self, logger):
-        self._terminal_ports =3D {}
-        self._line_callbacks =3D []
         self._logger =3D logger
         self._fvp_process =3D None
         self._telnets =3D []
         self._pexpects =3D []
=20
-    def add_line_callback(self, callback):
-        self._line_callbacks.append(callback)
-
     def start(self, config, extra_args=3D[], terminal_choice=3D"none"):
         cli =3D cli_from_config(config, terminal_choice)
         cli +=3D extra_args
@@ -73,14 +94,6 @@ class FVPRunner:
             stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.STDOUT,
             env=3Denv)
=20
-        def detect_terminals(line):
-            m =3D re.match(r"^(\S+): Listening for serial connection on =
port (\d+)$", line)
-            if m:
-                terminal =3D m.group(1)
-                port =3D int(m.group(2))
-                self._terminal_ports[terminal] =3D port
-        self.add_line_callback(detect_terminals)
-
     def stop(self):
         if self._fvp_process:
             self._logger.debug(f"Terminating FVP PID {self._fvp_process.=
pid}")
@@ -117,34 +130,21 @@ class FVPRunner:
         else:
             return 0
=20
-    def run(self, until=3DNone):
-        if until and until():
-            return
+    def wait(self, timeout):
+        self._fvp_process.wait(timeout)
=20
-        for line in self._fvp_process.stdout:
-            line =3D line.strip().decode("utf-8", errors=3D"replace")
-            for callback in self._line_callbacks:
-                callback(line)
-            if until and until():
-                return
+    @property
+    def stdout(self):
+        return self._fvp_process.stdout
=20
-    def _get_terminal_port(self, terminal):
-        def terminal_exists():
-            return terminal in self._terminal_ports
-        self.run(terminal_exists)
-        return self._terminal_ports[terminal]
-
-    def create_telnet(self, terminal):
+    def create_telnet(self, port):
         check_telnet()
-        port =3D self._get_terminal_port(terminal)
         telnet =3D subprocess.Popen(["telnet", "localhost", str(port)], =
stdin=3Dsys.stdin, stdout=3Dsys.stdout)
         self._telnets.append(telnet)
         return telnet
=20
-    def create_pexpect(self, terminal, **kwargs):
-        check_telnet()
+    def create_pexpect(self, port, **kwargs):
         import pexpect
-        port =3D self._get_terminal_port(terminal)
         instance =3D pexpect.spawn(f"telnet localhost {port}", **kwargs)
         self._pexpects.append(instance)
         return instance
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index dfc2b88b..0c3c2214 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -52,8 +52,10 @@ class OEFVPTarget(OEFVPSSHTarget):
         self.boot_timeout =3D 10 * 60
=20
     def _after_start(self):
+        parser =3D runner.ConsolePortParser(self.fvp.stdout)
         self.logger.debug(f"Awaiting console on terminal {self.config['c=
onsoles']['default']}")
-        console =3D self.fvp.create_pexpect(self.config['consoles']['def=
ault'])
+        port =3D parser.parse_port(self.config['consoles']['default'])
+        console =3D self.fvp.create_pexpect(port)
         try:
             console.expect("login\\:", timeout=3Dself.boot_timeout)
             self.logger.debug("Found login prompt")
@@ -85,12 +87,6 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
         self.test_log_suffix =3D pathlib.Path(bootlog).suffix
         self.bootlog =3D bootlog
=20
-    def _add_terminal(self, name, fvp_name):
-        logfile =3D self._create_logfile(name)
-        self.logger.info(f'Creating terminal {name} on {fvp_name}')
-        self.terminals[name] =3D \
-            self.fvp.create_pexpect(fvp_name, logfile=3Dlogfile)
-
     def _create_logfile(self, name):
         fvp_log_file =3D f"{name}_log{self.test_log_suffix}"
         fvp_log_path =3D pathlib.Path(self.test_log_path, fvp_log_file)
@@ -103,8 +99,13 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
         return open(fvp_log_path, 'wb')
=20
     def _after_start(self):
+        parser =3D runner.ConsolePortParser(self.fvp.stdout)
         for name, console in self.config["consoles"].items():
-            self._add_terminal(name, console)
+            logfile =3D self._create_logfile(name)
+            self.logger.info(f'Creating terminal {name} on {console}')
+            port =3D parser.parse_port(console)
+            self.terminals[name] =3D \
+                self.fvp.create_pexpect(port, logfile=3Dlogfile)
=20
             # testimage.bbclass expects to see a log file at `bootlog`,
             # so make a symlink to the 'default' log file
diff --git a/scripts/runfvp b/scripts/runfvp
index 727223ca..454acb86 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -52,17 +52,18 @@ def start_fvp(args, config, extra_args):
         fvp.start(config, extra_args, args.terminals)
=20
         if args.console:
-            fvp.add_line_callback(lambda line: logger.debug(f"FVP output=
: {line}"))
             expected_terminal =3D config["consoles"]["default"]
             if not expected_terminal:
                 logger.error("--console used but FVP_CONSOLE not set in =
machine configuration")
                 return 1
-            telnet =3D fvp.create_telnet(expected_terminal)
+            parser =3D runner.ConsolePortParser(fvp.stdout)
+            port =3D parser.parse_port(expected_terminal)
+            telnet =3D fvp.create_telnet(port)
             telnet.wait()
             logger.debug(f"Telnet quit, cancelling tasks")
         else:
-            fvp.add_line_callback(lambda line: print(line))
-            fvp.run()
+            for line in fvp.stdout:
+                print(line.strip().decode(errors=3D'ignore'))
=20
     finally:
         fvp.stop()
--=20
2.25.1


