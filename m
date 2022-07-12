Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0502CCA480
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:28:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7575.1657621736165982055
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 03:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C35491515;
	Tue, 12 Jul 2022 03:28:55 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABE5F3F792;
	Tue, 12 Jul 2022 03:28:54 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 5/6] arm/oeqa: Create new OEFVPSerialTarget with pexpect
 interface
Date: Tue, 12 Jul 2022 11:28:29 +0100
Message-Id: <20220712102830.625090-6-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712102830.625090-1-peter.hoyes@arm.com>
References: <20220712102830.625090-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 10:28:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3559

From: Peter Hoyes <Peter.Hoyes@arm.com>

Refactor OEFVPTarget into new base class, OEFVPSSHTarget. OEFVPTarget
extends OEFVPSSHTarget and additionally waits for a Linux login prompt
for compatibility with tests in OE-core.

OEFVPSerialTarget also extends OEFVPSSHTarget. It also exposes the
entire API of pexpect, with the first argument being the
FVP_TEST_CONSOLE varflag key. It logs each console output to separate
files inside the core-image-minimal work directory.

Issue-Id: SCM-4957
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I1b93f94471c6311da9ee71a48239640ee37de0af
---
 meta-arm/lib/oeqa/controllers/fvp.py | 137 +++++++++++++++++++++++----
 1 file changed, 118 insertions(+), 19 deletions(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index c0a87ba..ad01c11 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -1,45 +1,45 @@
 import asyncio
 import pathlib
 import pexpect
+import os
=20
-import oeqa.core.target.ssh
+from oeqa.core.target.ssh import OESSHTarget
 from fvp import conffile, runner
=20
-class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
+
+class OEFVPSSHTarget(OESSHTarget):
+    """
+    Base class for meta-arm FVP targets.
+    Contains common logic to start and stop an FVP.
+    """
     def __init__(self, logger, target_ip, server_ip, timeout=3D300, user=
=3D'root',
-                 port=3DNone, server_port=3D0, dir_image=3DNone, rootfs=3D=
None, bootlog=3DNone,
-                 **kwargs):
+                 port=3DNone, dir_image=3DNone, rootfs=3DNone, **kwargs)=
:
         super().__init__(logger, target_ip, server_ip, timeout, user, po=
rt)
         image_dir =3D pathlib.Path(dir_image)
         # rootfs may have multiple extensions so we need to strip *all* =
suffixes
         basename =3D pathlib.Path(rootfs)
         basename =3D basename.name.replace("".join(basename.suffixes), "=
")
         self.fvpconf =3D image_dir / (basename + ".fvpconf")
+        self.config =3D conffile.load(self.fvpconf)
=20
         if not self.fvpconf.exists():
             raise FileNotFoundError(f"Cannot find {self.fvpconf}")
-        # FVPs boot slowly, so allow ten minutes
-        self.boot_timeout =3D 10 * 60
-
-        self.logfile =3D bootlog and open(bootlog, "wb") or None
=20
     async def boot_fvp(self):
-        config =3D conffile.load(self.fvpconf)
         self.fvp =3D runner.FVPRunner(self.logger)
-        await self.fvp.start(config)
+        await self.fvp.start(self.config)
         self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
-        console =3D await self.fvp.create_pexpect(config["console"])
-        try:
-            console.expect("login\:", timeout=3Dself.boot_timeout)
-            self.logger.debug("Found login prompt")
-        except pexpect.TIMEOUT:
-            self.logger.info("Timed out waiting for login prompt.")
-            self.logger.info("Boot log follows:")
-            self.logger.info(b"\n".join(console.before.splitlines()[-200=
:]).decode("utf-8", errors=3D"replace"))
-            raise RuntimeError("Failed to start FVP.")
+        await self._after_start()
+
+    async def _after_start(self):
+        pass
+
+    async def _after_stop(self):
+        pass
=20
     async def stop_fvp(self):
         returncode =3D await self.fvp.stop()
+        await self._after_stop()
=20
         self.logger.debug(f"Stopped FVP with return code {returncode}")
=20
@@ -51,3 +51,102 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
     def stop(self, **kwargs):
         loop =3D asyncio.get_event_loop()
         loop.run_until_complete(asyncio.gather(self.stop_fvp()))
+
+
+class OEFVPTarget(OEFVPSSHTarget):
+    """
+    For compatibility with OE-core test cases, this target's start() met=
hod
+    waits for a Linux shell before returning to ensure that SSH commands=
 work
+    with the default test dependencies.
+    """
+    def __init__(self, logger, target_ip, server_ip, bootlog=3DNone, **k=
wargs):
+        super().__init__(logger, target_ip, server_ip, **kwargs)
+        self.logfile =3D bootlog and open(bootlog, "wb") or None
+
+        # FVPs boot slowly, so allow ten minutes
+        self.boot_timeout =3D 10 * 60
+
+    async def _after_start(self):
+        self.logger.debug(f"Awaiting console on terminal {self.config['c=
onsoles']['default']}")
+        console =3D await self.fvp.create_pexpect(self.config['consoles'=
]['default'])
+        try:
+            console.expect("login\\:", timeout=3Dself.boot_timeout)
+            self.logger.debug("Found login prompt")
+        except pexpect.TIMEOUT:
+            self.logger.info("Timed out waiting for login prompt.")
+            self.logger.info("Boot log follows:")
+            self.logger.info(b"\n".join(console.before.splitlines()[-200=
:]).decode("utf-8", errors=3D"replace"))
+            raise RuntimeError("Failed to start FVP.")
+
+
+class OEFVPSerialTarget(OEFVPSSHTarget):
+    """
+    This target is intended for interaction with the target over one or =
more
+    telnet consoles using pexpect.
+   =20
+    This still depends on OEFVPSSHTarget so SSH commands can still be ru=
n on
+    the target, but note that this class does not inherently guarantee t=
hat
+    the SSH server is running prior to running test cases. Test cases th=
at use
+    SSH should first validate that SSH is available.
+    """
+    DEFAULT_CONSOLE =3D "default"
+
+    def __init__(self, logger, target_ip, server_ip, bootlog=3DNone, **k=
wargs):
+        super().__init__(logger, target_ip, server_ip, **kwargs)
+        self.terminals =3D {}
+
+        self.test_log_path =3D pathlib.Path(bootlog).parent
+        self.test_log_suffix =3D pathlib.Path(bootlog).suffix
+        self.bootlog =3D bootlog
+
+    async def _add_terminal(self, name, fvp_name):
+        logfile =3D self._create_logfile(name)
+        self.logger.info(f'Creating terminal {name} on {fvp_name}')
+        self.terminals[name] =3D \
+            await self.fvp.create_pexpect(fvp_name, logfile=3Dlogfile)
+
+    def _create_logfile(self, name):
+        fvp_log_file =3D f"{name}_log{self.test_log_suffix}"
+        fvp_log_path =3D pathlib.Path(self.test_log_path, fvp_log_file)
+        fvp_log_symlink =3D pathlib.Path(self.test_log_path, f"{name}_lo=
g")
+        try:
+            os.remove(fvp_log_symlink)
+        except:
+            pass
+        os.symlink(fvp_log_file, fvp_log_symlink)
+        return open(fvp_log_path, 'wb')
+
+    async def _after_start(self):
+        for name, console in self.config["consoles"].items():
+            await self._add_terminal(name, console)
+
+            # testimage.bbclass expects to see a log file at `bootlog`,
+            # so make a symlink to the 'default' log file
+            if name =3D=3D 'default':
+                default_test_file =3D f"{name}_log{self.test_log_suffix}=
"
+                os.symlink(default_test_file, self.bootlog)
+
+    async def _after_stop(self):
+        # Ensure pexpect logs all remaining output to the logfile
+        for terminal in self.terminals.values():
+            terminal.expect(pexpect.EOF, timeout=3D5)
+            terminal.close()
+
+    def _get_terminal(self, name):
+        return self.terminals[name]
+
+    def __getattr__(self, name):
+        """
+        Magic method which automatically exposes the whole pexpect API o=
n the
+        target, with the first argument being the terminal name.
+
+        e.g. self.target.expect(self.target.DEFAULT_CONSOLE, "login\\:")
+        """
+        def call_pexpect(terminal, *args, **kwargs):
+            attr =3D getattr(self.terminals[terminal], name)
+            if callable(attr):
+                return attr(*args, **kwargs)
+            else:
+                return attr
+
+        return call_pexpect
--=20
2.25.1


