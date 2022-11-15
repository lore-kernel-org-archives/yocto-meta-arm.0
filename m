Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D95DC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 15:01:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6496.1668524498683333715
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 07:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 994DC13D5;
	Tue, 15 Nov 2022 07:01:44 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA2923F587;
	Tue, 15 Nov 2022 07:01:37 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 4/5] arm/oeqa: Log the FVP output in OEFVPSSHTarget
Date: Tue, 15 Nov 2022 15:01:15 +0000
Message-Id: <20221115150116.314729-4-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115150116.314729-1-peter.hoyes@arm.com>
References: <20221115150116.314729-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 15:01:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4132

From: Peter Hoyes <Peter.Hoyes@arm.com>

It is often useful to inspect the FVP output after running the tests.

Refactor OEFVPSerialTarget._create_logfile into
OEFVPSSHTarget._create_log_filename, so that all FVP test controllers
are able to create secondary log files.

Pass a filehandle to the stdout argument of run_fvp so that the FVP
output is asynchronously logged to a file. Change the port parsing logic
to read back from the same log file instead of reading the stdout
directly.

Issue-Id: SCM-5314
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I2ddb423fa0d896c13d3e96884858c680c4d34555
---
 documentation/oeqa-fvp.md            |  2 +-
 meta-arm/lib/fvp/runner.py           |  4 +-
 meta-arm/lib/oeqa/controllers/fvp.py | 97 +++++++++++++++-------------
 3 files changed, 54 insertions(+), 49 deletions(-)

diff --git a/documentation/oeqa-fvp.md b/documentation/oeqa-fvp.md
index 582dd38b..e1468851 100644
--- a/documentation/oeqa-fvp.md
+++ b/documentation/oeqa-fvp.md
@@ -4,7 +4,7 @@ OE-Core's [oeqa][OEQA] framework provides a method of per=
forming runtime tests o
=20
 Tests can be configured to run automatically post-build by setting the v=
ariable `TESTIMAGE_AUTO=3D"1"`, e.g. in your Kas file or local.conf.
=20
-There are two main methods of testing, using different test "targets".
+There are two main methods of testing, using different test "targets". B=
oth test targets generate an additional log file with the prefix 'fvp_log=
' in the image recipe's `${WORKDIR}/testimage` containing the FVP's stdou=
t.
=20
 ## OEFVPTarget
=20
diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 5c5ded28..f55c579d 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -77,7 +77,7 @@ class FVPRunner:
         self._telnets =3D []
         self._pexpects =3D []
=20
-    def start(self, config, extra_args=3D[], terminal_choice=3D"none"):
+    def start(self, config, extra_args=3D[], terminal_choice=3D"none", s=
tdout=3Dsubprocess.PIPE):
         cli =3D cli_from_config(config, terminal_choice)
         cli +=3D extra_args
=20
@@ -91,7 +91,7 @@ class FVPRunner:
         self._logger.debug(f"Constructed FVP call: {shlex.join(cli)}")
         self._fvp_process =3D subprocess.Popen(
             cli,
-            stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.STDOUT,
+            stdin=3Dsubprocess.DEVNULL, stdout=3Dstdout, stderr=3Dsubpro=
cess.STDOUT,
             env=3Denv)
=20
     def stop(self):
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 0c3c2214..e8a094f1 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -12,7 +12,7 @@ class OEFVPSSHTarget(OESSHTarget):
     Contains common logic to start and stop an FVP.
     """
     def __init__(self, logger, target_ip, server_ip, timeout=3D300, user=
=3D'root',
-                 port=3DNone, dir_image=3DNone, rootfs=3DNone, **kwargs)=
:
+                 port=3DNone, dir_image=3DNone, rootfs=3DNone, bootlog=3D=
None, **kwargs):
         super().__init__(logger, target_ip, server_ip, timeout, user, po=
rt)
         image_dir =3D pathlib.Path(dir_image)
         # rootfs may have multiple extensions so we need to strip *all* =
suffixes
@@ -20,6 +20,7 @@ class OEFVPSSHTarget(OESSHTarget):
         basename =3D basename.name.replace("".join(basename.suffixes), "=
")
         self.fvpconf =3D image_dir / (basename + ".fvpconf")
         self.config =3D conffile.load(self.fvpconf)
+        self.bootlog =3D bootlog
=20
         if not self.fvpconf.exists():
             raise FileNotFoundError(f"Cannot find {self.fvpconf}")
@@ -28,8 +29,9 @@ class OEFVPSSHTarget(OESSHTarget):
         pass
=20
     def start(self, **kwargs):
+        self.fvp_log =3D self._create_logfile("fvp")
         self.fvp =3D runner.FVPRunner(self.logger)
-        self.fvp.start(self.config)
+        self.fvp.start(self.config, stdout=3Dself.fvp_log)
         self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
         self._after_start()
=20
@@ -37,6 +39,22 @@ class OEFVPSSHTarget(OESSHTarget):
         returncode =3D self.fvp.stop()
         self.logger.debug(f"Stopped FVP with return code {returncode}")
=20
+    def _create_logfile(self, name):
+        if not self.bootlog:
+            return None
+
+        test_log_path =3D pathlib.Path(self.bootlog).parent
+        test_log_suffix =3D pathlib.Path(self.bootlog).suffix
+        fvp_log_file =3D f"{name}_log{test_log_suffix}"
+        fvp_log_path =3D pathlib.Path(test_log_path, fvp_log_file)
+        fvp_log_symlink =3D pathlib.Path(test_log_path, f"{name}_log")
+        try:
+            os.remove(fvp_log_symlink)
+        except:
+            pass
+        os.symlink(fvp_log_file, fvp_log_symlink)
+        return open(fvp_log_path, 'wb')
+
=20
 class OEFVPTarget(OEFVPSSHTarget):
     """
@@ -44,33 +62,34 @@ class OEFVPTarget(OEFVPSSHTarget):
     waits for a Linux shell before returning to ensure that SSH commands=
 work
     with the default test dependencies.
     """
-    def __init__(self, logger, target_ip, server_ip, bootlog=3DNone, **k=
wargs):
+    def __init__(self, logger, target_ip, server_ip, **kwargs):
         super().__init__(logger, target_ip, server_ip, **kwargs)
-        self.logfile =3D bootlog and open(bootlog, "wb") or None
+        self.logfile =3D self.bootlog and open(self.bootlog, "wb") or No=
ne
=20
         # FVPs boot slowly, so allow ten minutes
         self.boot_timeout =3D 10 * 60
=20
     def _after_start(self):
-        parser =3D runner.ConsolePortParser(self.fvp.stdout)
-        self.logger.debug(f"Awaiting console on terminal {self.config['c=
onsoles']['default']}")
-        port =3D parser.parse_port(self.config['consoles']['default'])
-        console =3D self.fvp.create_pexpect(port)
-        try:
-            console.expect("login\\:", timeout=3Dself.boot_timeout)
-            self.logger.debug("Found login prompt")
-        except pexpect.TIMEOUT:
-            self.logger.info("Timed out waiting for login prompt.")
-            self.logger.info("Boot log follows:")
-            self.logger.info(b"\n".join(console.before.splitlines()[-200=
:]).decode("utf-8", errors=3D"replace"))
-            raise RuntimeError("Failed to start FVP.")
+        with open(self.fvp_log.name, 'rb') as logfile:
+            parser =3D runner.ConsolePortParser(logfile)
+            self.logger.debug(f"Awaiting console on terminal {self.confi=
g['consoles']['default']}")
+            port =3D parser.parse_port(self.config['consoles']['default'=
])
+            console =3D self.fvp.create_pexpect(port)
+            try:
+                console.expect("login\\:", timeout=3Dself.boot_timeout)
+                self.logger.debug("Found login prompt")
+            except pexpect.TIMEOUT:
+                self.logger.info("Timed out waiting for login prompt.")
+                self.logger.info("Boot log follows:")
+                self.logger.info(b"\n".join(console.before.splitlines()[=
-200:]).decode("utf-8", errors=3D"replace"))
+                raise RuntimeError("Failed to start FVP.")
=20
=20
 class OEFVPSerialTarget(OEFVPSSHTarget):
     """
     This target is intended for interaction with the target over one or =
more
     telnet consoles using pexpect.
-   =20
+
     This still depends on OEFVPSSHTarget so SSH commands can still be ru=
n on
     the target, but note that this class does not inherently guarantee t=
hat
     the SSH server is running prior to running test cases. Test cases th=
at use
@@ -79,39 +98,25 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
     """
     DEFAULT_CONSOLE =3D "default"
=20
-    def __init__(self, logger, target_ip, server_ip, bootlog=3DNone, **k=
wargs):
+    def __init__(self, logger, target_ip, server_ip, **kwargs):
         super().__init__(logger, target_ip, server_ip, **kwargs)
         self.terminals =3D {}
=20
-        self.test_log_path =3D pathlib.Path(bootlog).parent
-        self.test_log_suffix =3D pathlib.Path(bootlog).suffix
-        self.bootlog =3D bootlog
-
-    def _create_logfile(self, name):
-        fvp_log_file =3D f"{name}_log{self.test_log_suffix}"
-        fvp_log_path =3D pathlib.Path(self.test_log_path, fvp_log_file)
-        fvp_log_symlink =3D pathlib.Path(self.test_log_path, f"{name}_lo=
g")
-        try:
-            os.remove(fvp_log_symlink)
-        except:
-            pass
-        os.symlink(fvp_log_file, fvp_log_symlink)
-        return open(fvp_log_path, 'wb')
-
     def _after_start(self):
-        parser =3D runner.ConsolePortParser(self.fvp.stdout)
-        for name, console in self.config["consoles"].items():
-            logfile =3D self._create_logfile(name)
-            self.logger.info(f'Creating terminal {name} on {console}')
-            port =3D parser.parse_port(console)
-            self.terminals[name] =3D \
-                self.fvp.create_pexpect(port, logfile=3Dlogfile)
-
-            # testimage.bbclass expects to see a log file at `bootlog`,
-            # so make a symlink to the 'default' log file
-            if name =3D=3D 'default':
-                default_test_file =3D f"{name}_log{self.test_log_suffix}=
"
-                os.symlink(default_test_file, self.bootlog)
+        with open(self.fvp_log.name, 'rb') as logfile:
+            parser =3D runner.ConsolePortParser(logfile)
+            for name, console in self.config["consoles"].items():
+                logfile =3D self._create_logfile(name)
+                self.logger.info(f'Creating terminal {name} on {console}=
')
+                port =3D parser.parse_port(console)
+                self.terminals[name] =3D \
+                    self.fvp.create_pexpect(port, logfile=3Dlogfile)
+
+                # testimage.bbclass expects to see a log file at `bootlo=
g`,
+                # so make a symlink to the 'default' log file
+                if name =3D=3D 'default':
+                    default_test_file =3D f"{name}_log{self.test_log_suf=
fix}"
+                    os.symlink(default_test_file, self.bootlog)
=20
     def _get_terminal(self, name):
         return self.terminals[name]
--=20
2.25.1


