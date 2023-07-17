Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5FDC001B0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 18:57:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3240.1689620217519336043
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 11:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EB62D75;
	Mon, 17 Jul 2023 11:57:40 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.87.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E5133F67D;
	Mon, 17 Jul 2023 11:56:56 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/5] arm/OEFVPTarget: Add support for model state transitions
Date: Mon, 17 Jul 2023 19:56:24 +0100
Message-Id: <20230717185626.1793017-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717185626.1793017-1-peter.hoyes@arm.com>
References: <20230717185626.1793017-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 18:57:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4882

From: Peter Hoyes <Peter.Hoyes@arm.com>

To better support firmware testing alongside Linux runtime testing,
introduce model state support to OEFVPTarget. The following states are
supported using self.target.transition(state):
 * off
 * on
 * linux

Instead of assuming a specific state in OEFVPTarget.start,
responsibility is delegated to test cases to lazily put the model in
the required state. But to support OE-core test cases, OEFVPTarget.run
automatically puts the model in the "linux" state for running the
command. Firmware and Linux tests can subsequently run alongside each
other without introducing complex test dependencies.

The concept is inspired by Labgrid strategies [1], albeit simplified.

Tweak log file handling so that output is collected across (possibly)
multiple model processes.

[1] https://labgrid.readthedocs.io/en/latest/overview.html#strategies

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 77 ++++++++++++++++++----------
 1 file changed, 49 insertions(+), 28 deletions(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index ea572dd7..cfd8c4e9 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -1,3 +1,5 @@
+import contextlib
+import enum
 import pathlib
 import pexpect
 import os
@@ -5,6 +7,11 @@ import os
 from oeqa.core.target.ssh import OESSHTarget
 from fvp import runner
=20
+class OEFVPTargetState(str, enum.Enum):
+    OFF =3D "off"
+    ON =3D "on"
+    LINUX =3D "linux"
+
=20
 class OEFVPTarget(OESSHTarget):
     """
@@ -27,37 +34,50 @@ class OEFVPTarget(OESSHTarget):
=20
         self.bootlog =3D bootlog
         self.terminals =3D {}
-        self.booted =3D False
+        self.stack =3D None
+        self.state =3D OEFVPTargetState.OFF
=20
-    def start(self, **kwargs):
-        self.fvp_log =3D self._create_logfile("fvp")
-        self.fvp =3D runner.FVPRunner(self.logger)
-        self.fvp.start(self.fvpconf, stdout=3Dself.fvp_log)
-        self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
-        self._setup_consoles()
-
-    def await_boot(self):
-        if self.booted:
+    def transition(self, state, timeout=3D10*60):
+        if state =3D=3D self.state:
             return
=20
-        # FVPs boot slowly, so allow ten minutes
-        boot_timeout =3D 10*60
-        try:
-            self.expect(OEFVPTarget.DEFAULT_CONSOLE, "login\\:", timeout=
=3Dboot_timeout)
-            self.logger.debug("Found login prompt")
-            self.booted =3D True
-        except pexpect.TIMEOUT:
-            self.logger.info("Timed out waiting for login prompt.")
-            self.logger.info("Boot log follows:")
-            self.logger.info(b"\n".join(self.before(OEFVPTarget.DEFAULT_=
CONSOLE).splitlines()[-200:]).decode("utf-8", errors=3D"replace"))
-            raise RuntimeError("Failed to start FVP.")
+        if state =3D=3D OEFVPTargetState.OFF:
+            returncode =3D self.fvp.stop()
+            self.logger.debug(f"Stopped FVP with return code {returncode=
}")
+            self.stack.close()
+        elif state =3D=3D OEFVPTargetState.ON:
+            self.transition(OEFVPTargetState.OFF, timeout)
+            self.stack =3D contextlib.ExitStack()
+            self.fvp =3D runner.FVPRunner(self.logger)
+            self.fvp_log =3D self._create_logfile("fvp", "wb")
+            self.fvp.start(self.fvpconf, stdout=3Dself.fvp_log)
+            self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
+            self._setup_consoles()
+        elif state =3D=3D OEFVPTargetState.LINUX:
+            self.transition(OEFVPTargetState.ON, timeout)
+            try:
+                self.expect(OEFVPTarget.DEFAULT_CONSOLE, "login\\:", tim=
eout=3Dtimeout)
+                self.logger.debug("Found login prompt")
+                self.state =3D OEFVPTargetState.LINUX
+            except pexpect.TIMEOUT:
+                self.logger.info("Timed out waiting for login prompt.")
+                self.logger.info("Boot log follows:")
+                self.logger.info(b"\n".join(self.before(OEFVPTarget.DEFA=
ULT_CONSOLE).splitlines()[-200:]).decode("utf-8", errors=3D"replace"))
+                raise RuntimeError("Failed to start FVP.")
+
+        self.logger.info(f"Transitioned to {state}")
+        self.state =3D state
+
+    def start(self, **kwargs):
+        # No-op - put the FVP in the required state lazily
+        pass
=20
     def stop(self, **kwargs):
-        returncode =3D self.fvp.stop()
-        self.logger.debug(f"Stopped FVP with return code {returncode}")
+        self.transition(OEFVPTargetState.OFF)
=20
     def run(self, cmd, timeout=3DNone):
-        self.await_boot()
+        # Running a command implies the LINUX state
+        self.transition(OEFVPTargetState.LINUX)
         return super().run(cmd, timeout)
=20
     def _setup_consoles(self):
@@ -73,11 +93,12 @@ class OEFVPTarget(OESSHTarget):
=20
                 # testimage.bbclass expects to see a log file at `bootlo=
g`,
                 # so make a symlink to the 'default' log file
-                if name =3D=3D 'default':
-                    default_test_file =3D f"{name}_log{self.test_log_suf=
fix}"
+                test_log_suffix =3D pathlib.Path(self.bootlog).suffix
+                default_test_file =3D f"{name}_log{test_log_suffix}"
+                if name =3D=3D 'default' and not os.path.exists(self.boo=
tlog):
                     os.symlink(default_test_file, self.bootlog)
=20
-    def _create_logfile(self, name):
+    def _create_logfile(self, name, mode=3D'ab'):
         if not self.bootlog:
             return None
=20
@@ -91,7 +112,7 @@ class OEFVPTarget(OESSHTarget):
         except:
             pass
         os.symlink(fvp_log_file, fvp_log_symlink)
-        return open(fvp_log_path, 'wb')
+        return self.stack.enter_context(open(fvp_log_path, mode))
=20
     def _get_terminal(self, name):
         return self.terminals[name]
--=20
2.34.1


