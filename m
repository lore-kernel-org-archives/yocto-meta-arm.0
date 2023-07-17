Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AA1C3DA41
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 18:57:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3323.1689620216779231487
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 11:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D857C15;
	Mon, 17 Jul 2023 11:57:39 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.87.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F304F3F67D;
	Mon, 17 Jul 2023 11:56:54 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/5] arm/oeqa: Merge all OEFVP*Target classes
Date: Mon, 17 Jul 2023 19:56:23 +0100
Message-Id: <20230717185626.1793017-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717185626.1793017-1-peter.hoyes@arm.com>
References: <20230717185626.1793017-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 18:57:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4881

From: Peter Hoyes <Peter.Hoyes@arm.com>

The differences between OEFVPTarget, OEFVPSSHTarget and
OEFVPSerialTarget are not obvious and there is a lot of duplication.

Merge all the logic into one OEFVPTarget (again). This has the following
features:
 * Run SSH commands
 * Run serial console assertions
 * Lazily await a Linux login prompt while running test cases (only when
   self.target.run is called).

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 documentation/oeqa-fvp.md                     |  46 +++----
 .../conf/machine/corstone1000-fvp.conf        |   2 +-
 meta-arm-bsp/conf/machine/corstone500.conf    |   2 +-
 .../conf/machine/fvp-baser-aemv8r64.conf      |   2 +-
 meta-arm-bsp/conf/machine/tc1.conf            |   2 +-
 meta-arm/lib/oeqa/controllers/fvp.py          | 118 +++++++-----------
 meta-arm/lib/oeqa/runtime/cases/linuxboot.py  |   4 +-
 7 files changed, 71 insertions(+), 105 deletions(-)

diff --git a/documentation/oeqa-fvp.md b/documentation/oeqa-fvp.md
index e1468851..b39e0963 100644
--- a/documentation/oeqa-fvp.md
+++ b/documentation/oeqa-fvp.md
@@ -4,32 +4,36 @@ OE-Core's [oeqa][OEQA] framework provides a method of p=
erforming runtime tests o
=20
 Tests can be configured to run automatically post-build by setting the v=
ariable `TESTIMAGE_AUTO=3D"1"`, e.g. in your Kas file or local.conf.
=20
-There are two main methods of testing, using different test "targets". B=
oth test targets generate an additional log file with the prefix 'fvp_log=
' in the image recipe's `${WORKDIR}/testimage` containing the FVP's stdou=
t.
+meta-arm provides the OEFVPTarget which must be set up in the machine co=
nfiguration:
+```
+TEST_TARGET =3D "OEFVPTarget"
+TEST_SERVER_IP =3D "127.0.0.1"
+TEST_TARGET_IP =3D "127.0.0.1:8022"
+IMAGE_FEATURES:append =3D " ssh-server-dropbear"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
+FVP_CONSOLES[default] =3D "terminal_0"
+FVP_CONSOLES[tf-a] =3D "s_terminal_0"
+```
+
+The test target also generates a log file with the prefix 'fvp_log' in t=
he image recipe's `${WORKDIR}/testimage` containing the FVP's stdout.
=20
-## OEFVPTarget
+OEFVPTarget supports two different test interfaces - SSH and pexpect.
=20
-This runs test cases on a machine using SSH. It therefore requires that =
an SSH server is installed in the image.
+## SSH
=20
-In test cases, the primary interface with the target is, e.g:
+As in OEQA in OE-core, tests cases can run commands on the machine using=
 SSH. It therefore requires that an SSH server is installed in the image.
+
+This uses the `run` method on the target, e.g:
 ```
 (status, output) =3D self.target.run('uname -a')
 ```
-which runs a single command on the target (using `ssh -c`) and returns t=
he status code and the output. It is therefore useful for running tests i=
n a Linux environment.
+which executes a single command on the target (using `ssh -c`) and retur=
ns the status code and the output. It is therefore useful for running tes=
ts in a Linux environment.
=20
 For examples of test cases, see meta/lib/oeqa/runtime/cases in OE-Core. =
The majority of test cases depend on `ssh.SSHTest.test_ssh`, which first =
validates that the SSH connection is functioning.
=20
-Example machine configuration:
-```
-TEST_TARGET =3D "OEFVPTarget"
-TEST_SERVER_IP =3D "127.0.0.1"
-TEST_TARGET_IP =3D "127.0.0.1:8022"
-IMAGE_FEATURES:append =3D " ssh-server-dropbear"
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
-```
-
-## OEFVPSerialTarget
+## pexpect
=20
-This runs tests against one or more serial consoles on the FVP. It is mo=
re flexible than OEFVPTarget, but test cases written for this test target=
 do not support the test cases in OE-core. As it does not require an SSH =
server, it is suitable for machines with performance or memory limitation=
s.
+To support firmware and baremetal testing, OEFVPTarget also allows test =
cases to make assertions against one or more consoles using the pexpect l=
ibrary.
=20
 Internally, this test target launches a [Pexpect][PEXPECT] instance for =
each entry in FVP_CONSOLES which can be used with the provided alias. The=
 whole Pexpect API is exposed on the target, where the alias is always pa=
ssed as the first argument, e.g.:
 ```
@@ -39,16 +43,6 @@ self.assertNotIn(b'ERROR:', self.target.before('tf-a')=
)
=20
 For an example of a full test case, see meta-arm/lib/oeqa/runtime/cases/=
linuxboot.py This test case can be used to minimally verify that a machin=
e boots to a Linux shell. The default timeout is 10 minutes, but this can=
 be configured with the variable TEST_FVP_LINUX_BOOT_TIMEOUT, which expec=
ts a value in seconds.
=20
-The SSH interface described above is also available on OEFVPSerialTarget=
 to support writing a set of hybrid test suites that use a combination of=
 serial and SSH access. Note however that this test target does not guara=
ntee that Linux has booted to shell prior to running any tests, so the te=
st cases in OE-core are not supported.
-
-Example machine configuration:
-```
-TEST_TARGET=3D"OEFVPSerialTarget"
-TEST_SUITES=3D"linuxboot"
-FVP_CONSOLES[default] =3D "terminal_0"
-FVP_CONSOLES[tf-a] =3D "s_terminal_0"
-```
-
 [OEQA]: https://docs.yoctoproject.org/test-manual/intro.html
 [FVP]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms
 [RUNFVP]: runfvp.md
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 66236515..40f69297 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -8,7 +8,7 @@ TFA_TARGET_PLATFORM =3D "fvp"
 TFM_PLATFORM_IS_FVP =3D "TRUE"
=20
 # testimage config
-TEST_TARGET =3D "OEFVPSerialTarget"
+TEST_TARGET =3D "OEFVPTarget"
 TEST_SUITES =3D "linuxboot"
=20
 # FVP Config
diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 4794028a..36ba7703 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -32,7 +32,7 @@ WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 WKS_FILE ?=3D "core-image-minimal.corstone500.wks"
=20
-TEST_TARGET =3D "OEFVPSerialTarget"
+TEST_TARGET =3D "OEFVPTarget"
 TEST_SUITES =3D "linuxboot"
=20
 FVP_PROVIDER ?=3D "fvp-corstone500-native"
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 62c9cbd0..b8a6aa46 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -29,7 +29,7 @@ MACHINE_FEATURES:append =3D " efi"
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 # testimage configuration
-TEST_TARGET =3D "OEFVPSerialTarget"
+TEST_TARGET =3D "OEFVPTarget"
 TEST_SUITES =3D "linuxboot"
 TEST_TARGET_IP ?=3D "127.0.0.1:8022"
 TEST_SERVER_IP ?=3D "127.0.1.1"
diff --git a/meta-arm-bsp/conf/machine/tc1.conf b/meta-arm-bsp/conf/machi=
ne/tc1.conf
index 5f68cc7a..bba2c191 100644
--- a/meta-arm-bsp/conf/machine/tc1.conf
+++ b/meta-arm-bsp/conf/machine/tc1.conf
@@ -6,7 +6,7 @@
=20
 require conf/machine/include/tc.inc
=20
-TEST_TARGET =3D "OEFVPSerialTarget"
+TEST_TARGET =3D "OEFVPTarget"
 TEST_SUITES =3D "linuxboot"
=20
 # FVP Config
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 38484072..ea572dd7 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -6,11 +6,14 @@ from oeqa.core.target.ssh import OESSHTarget
 from fvp import runner
=20
=20
-class OEFVPSSHTarget(OESSHTarget):
+class OEFVPTarget(OESSHTarget):
     """
-    Base class for meta-arm FVP targets.
-    Contains common logic to start and stop an FVP.
+    For compatibility with OE-core test cases, this target's start() met=
hod
+    waits for a Linux shell before returning to ensure that SSH commands=
 work
+    with the default test dependencies.
     """
+    DEFAULT_CONSOLE =3D "default"
+
     def __init__(self, logger, target_ip, server_ip, timeout=3D300, user=
=3D'root',
                  port=3DNone, dir_image=3DNone, rootfs=3DNone, bootlog=3D=
None, **kwargs):
         super().__init__(logger, target_ip, server_ip, timeout, user, po=
rt)
@@ -19,90 +22,45 @@ class OEFVPSSHTarget(OESSHTarget):
         basename =3D pathlib.Path(rootfs)
         basename =3D basename.name.replace("".join(basename.suffixes), "=
")
         self.fvpconf =3D image_dir / (basename + ".fvpconf")
-        self.bootlog =3D bootlog
-
         if not self.fvpconf.exists():
             raise FileNotFoundError(f"Cannot find {self.fvpconf}")
=20
-    def _after_start(self):
-        pass
+        self.bootlog =3D bootlog
+        self.terminals =3D {}
+        self.booted =3D False
=20
     def start(self, **kwargs):
         self.fvp_log =3D self._create_logfile("fvp")
         self.fvp =3D runner.FVPRunner(self.logger)
         self.fvp.start(self.fvpconf, stdout=3Dself.fvp_log)
         self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
-        self._after_start()
-
-    def stop(self, **kwargs):
-        returncode =3D self.fvp.stop()
-        self.logger.debug(f"Stopped FVP with return code {returncode}")
+        self._setup_consoles()
=20
-    def _create_logfile(self, name):
-        if not self.bootlog:
-            return None
-
-        test_log_path =3D pathlib.Path(self.bootlog).parent
-        test_log_suffix =3D pathlib.Path(self.bootlog).suffix
-        fvp_log_file =3D f"{name}_log{test_log_suffix}"
-        fvp_log_path =3D pathlib.Path(test_log_path, fvp_log_file)
-        fvp_log_symlink =3D pathlib.Path(test_log_path, f"{name}_log")
-        try:
-            os.remove(fvp_log_symlink)
-        except:
-            pass
-        os.symlink(fvp_log_file, fvp_log_symlink)
-        return open(fvp_log_path, 'wb')
-
-
-class OEFVPTarget(OEFVPSSHTarget):
-    """
-    For compatibility with OE-core test cases, this target's start() met=
hod
-    waits for a Linux shell before returning to ensure that SSH commands=
 work
-    with the default test dependencies.
-    """
-    def __init__(self, logger, target_ip, server_ip, **kwargs):
-        super().__init__(logger, target_ip, server_ip, **kwargs)
-        self.logfile =3D self.bootlog and open(self.bootlog, "wb") or No=
ne
+    def await_boot(self):
+        if self.booted:
+            return
=20
         # FVPs boot slowly, so allow ten minutes
-        self.boot_timeout =3D 10 * 60
+        boot_timeout =3D 10*60
+        try:
+            self.expect(OEFVPTarget.DEFAULT_CONSOLE, "login\\:", timeout=
=3Dboot_timeout)
+            self.logger.debug("Found login prompt")
+            self.booted =3D True
+        except pexpect.TIMEOUT:
+            self.logger.info("Timed out waiting for login prompt.")
+            self.logger.info("Boot log follows:")
+            self.logger.info(b"\n".join(self.before(OEFVPTarget.DEFAULT_=
CONSOLE).splitlines()[-200:]).decode("utf-8", errors=3D"replace"))
+            raise RuntimeError("Failed to start FVP.")
=20
-    def _after_start(self):
-        with open(self.fvp_log.name, 'rb') as logfile:
-            parser =3D runner.ConsolePortParser(logfile)
-            config =3D self.fvp.getConfig()
-            self.logger.debug(f"Awaiting console on terminal {config['co=
nsoles']['default']}")
-            port =3D parser.parse_port(config['consoles']['default'])
-            console =3D self.fvp.create_pexpect(port)
-            try:
-                console.expect("login\\:", timeout=3Dself.boot_timeout)
-                self.logger.debug("Found login prompt")
-            except pexpect.TIMEOUT:
-                self.logger.info("Timed out waiting for login prompt.")
-                self.logger.info("Boot log follows:")
-                self.logger.info(b"\n".join(console.before.splitlines()[=
-200:]).decode("utf-8", errors=3D"replace"))
-                raise RuntimeError("Failed to start FVP.")
-
-
-class OEFVPSerialTarget(OEFVPSSHTarget):
-    """
-    This target is intended for interaction with the target over one or =
more
-    telnet consoles using pexpect.
-
-    This still depends on OEFVPSSHTarget so SSH commands can still be ru=
n on
-    the target, but note that this class does not inherently guarantee t=
hat
-    the SSH server is running prior to running test cases. Test cases th=
at use
-    SSH should first validate that SSH is available, e.g. by depending o=
n the
-    "linuxboot" test case in meta-arm.
-    """
-    DEFAULT_CONSOLE =3D "default"
+    def stop(self, **kwargs):
+        returncode =3D self.fvp.stop()
+        self.logger.debug(f"Stopped FVP with return code {returncode}")
=20
-    def __init__(self, logger, target_ip, server_ip, **kwargs):
-        super().__init__(logger, target_ip, server_ip, **kwargs)
-        self.terminals =3D {}
+    def run(self, cmd, timeout=3DNone):
+        self.await_boot()
+        return super().run(cmd, timeout)
=20
-    def _after_start(self):
+    def _setup_consoles(self):
         with open(self.fvp_log.name, 'rb') as logfile:
             parser =3D runner.ConsolePortParser(logfile)
             config =3D self.fvp.getConfig()
@@ -119,6 +77,22 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
                     default_test_file =3D f"{name}_log{self.test_log_suf=
fix}"
                     os.symlink(default_test_file, self.bootlog)
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
     def _get_terminal(self, name):
         return self.terminals[name]
=20
diff --git a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py b/meta-arm/lib/=
oeqa/runtime/cases/linuxboot.py
index 99a8e78b..184eb6c9 100644
--- a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
+++ b/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
@@ -5,9 +5,7 @@ from oeqa.runtime.case import OERuntimeTestCase
=20
 class LinuxBootTest(OERuntimeTestCase):
     """
-    This test case is only compatible with the OEFVPSerialTarget as it u=
ses
-    the pexpect interface. It waits for a Linux login prompt on the defa=
ult
-    console.
+    This test waits for a Linux login prompt on the default console.
     """
=20
     def setUp(self):
--=20
2.34.1


