Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FD9C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:09:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3818.1663070957267244392
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 05:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 311641063;
	Tue, 13 Sep 2022 05:09:23 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DC9A3F71A;
	Tue, 13 Sep 2022 05:09:16 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH v2] arm/lib: Specify the FVP environment variables explicitly
Date: Tue, 13 Sep 2022 13:08:50 +0100
Message-Id: <20220913120850.1409443-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Sep 2022 12:09:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3772

From: Peter Hoyes <Peter.Hoyes@arm.com>

It is sometimes useful to be able to configure the behavior of FVPs
using environment variables, e.g. for licensing or plugins.

Add a new FVP option: FVP_ENV_PASSTHROUGH, which allows the Bitbake
variables to be passed to the environment to be specified explicitly (in
a similar way to BB_ENV_PASSTHROUGH). This ensures that:

 * FVPs launched via runfvp have a reproducable environment
 * FVPs launched via testimage (which run from an isolated Bitbake task)
   can receive environment variables

Change the self-tests to use cwd instead of PATH to find the mock FVPs,
as the PATH environment variable is no longer passed through.

Issue-Id: SCM-4964
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Idf6ac6d41fda4cd5f950bc383c2fc1fa1acdf4e3
---
 documentation/runfvp.md                              |  8 ++++++++
 meta-arm/classes/fvpboot.bbclass                     |  6 ++++++
 meta-arm/lib/fvp/conffile.py                         |  1 +
 meta-arm/lib/fvp/runner.py                           |  5 ++++-
 meta-arm/lib/oeqa/selftest/cases/runfvp.py           | 12 ++++++------
 .../lib/oeqa/selftest/cases/tests/auto-basic.json    |  1 +
 .../oeqa/selftest/cases/tests/auto-parameters.json   |  1 +
 .../oeqa/selftest/cases/tests/test-parameter.json    |  1 +
 8 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/documentation/runfvp.md b/documentation/runfvp.md
index c792f4e0..01b13693 100644
--- a/documentation/runfvp.md
+++ b/documentation/runfvp.md
@@ -116,6 +116,14 @@ Arbitrary extra arguments that are passed directly t=
o the FVP.  For example:
 FVP_EXTRA_ARGS =3D "--simlimit 60"
 ```
=20
+### `FVP_ENV_PASSTHROUGH`
+
+The FVP is launched with an isolated set of environment variables. Add t=
he name of a Bitbake variable to this list to pass it through to the FVP =
environment. For example:
+
+```
+FVP_ENV_PASSTHROUGH =3D "ARMLMD_LICENSE_FILE FM_TRACE_PLUGINS"
+```
+
=20
 [AEM]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms/arm-ecosystem-models
 [FVP]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms
diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index fbdfa965..78dabd73 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -23,6 +23,8 @@ FVP_CONSOLE ?=3D ""
 FVP_CONSOLES[default] ?=3D "${FVP_CONSOLE}"
 # Arbitrary extra arguments
 FVP_EXTRA_ARGS ?=3D ""
+# Bitbake variables to pass to the FVP environment
+FVP_ENV_PASSTHROUGH ?=3D ""
=20
 EXTRA_IMAGEDEPENDS +=3D "${FVP_PROVIDER}"
=20
@@ -66,6 +68,10 @@ python do_write_fvpboot_conf() {
     data["terminals"] =3D getFlags("FVP_TERMINALS")
     data["args"] =3D shlex.split(d.getVar("FVP_EXTRA_ARGS") or "")
=20
+    data["env"] =3D {}
+    for var in d.getVar("FVP_ENV_PASSTHROUGH").split():
+        data["env"][var] =3D d.getVar(var)
+
     os.makedirs(os.path.dirname(conffile), exist_ok=3DTrue)
     with open(conffile, "wt") as f:
         json.dump(data, f)
diff --git a/meta-arm/lib/fvp/conffile.py b/meta-arm/lib/fvp/conffile.py
index acede40e..603851d1 100644
--- a/meta-arm/lib/fvp/conffile.py
+++ b/meta-arm/lib/fvp/conffile.py
@@ -51,6 +51,7 @@ def load(config_file):
     sanitise("terminals", {})
     sanitise("args", [])
     sanitise("consoles", {})
+    sanitise("env", {})
=20
     if not config["exe"]:
         raise ValueError("Required value FVP_EXE not set in machine conf=
iguration")
diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 7641cd67..8c6b4cad 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -60,7 +60,10 @@ class FVPRunner:
         cli =3D cli_from_config(config, terminal_choice)
         cli +=3D extra_args
         self._logger.debug(f"Constructed FVP call: {cli}")
-        self._fvp_process =3D await asyncio.create_subprocess_exec(*cli,=
 stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=3Dsubproces=
s.STDOUT)
+        self._fvp_process =3D await asyncio.create_subprocess_exec(
+            *cli,
+            stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.STDOUT,
+            env=3Dconfig['env'])
=20
         def detect_terminals(line):
             m =3D re.match(r"^(\S+): Listening for serial connection on =
port (\d+)$", line)
diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
index d1e452f6..e1bf2040 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -20,11 +20,10 @@ class RunFVPTests(OESelftestTestCase):
         on exit code 0 or fail the test, otherwise return the CompletedP=
rocess
         instance.
         """
-        # Put the test directory in PATH so that any mock FVPs are found=
 first
-        newenv =3D {"PATH": str(testdir) + ":" + os.environ["PATH"]}
         cli =3D [runfvp,] + list(args)
         print(f"Calling {cli}")
-        ret =3D subprocess.run(cli, env=3Dnewenv, stdout=3Dsubprocess.PI=
PE, stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
+        # Set cwd to testdir so that any mock FVPs are found
+        ret =3D subprocess.run(cli, cwd=3Dtestdir, stdout=3Dsubprocess.P=
IPE, stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
         if should_succeed:
             self.assertEqual(ret.returncode, 0, f"runfvp exit {ret.retur=
ncode}, output: {ret.stdout}")
             return ret.stdout
@@ -40,8 +39,6 @@ class RunFVPTests(OESelftestTestCase):
         self.run_fvp("--this-is-an-invalid-option", should_succeed=3DFal=
se)
=20
     def test_run_auto_tests(self):
-        newenv =3D {"PATH": str(testdir) + ":" + os.environ["PATH"]}
-
         cases =3D list(testdir.glob("auto-*.json"))
         if not cases:
             self.fail("No tests found")
@@ -79,6 +76,7 @@ class ConfFileTests(OESelftestTestCase):
             self.assertTrue("terminals" in conf)
             self.assertTrue("args" in conf)
             self.assertTrue("consoles" in conf)
+            self.assertTrue("env" in conf)
=20
=20
 class RunnerTests(OESelftestTestCase):
@@ -97,6 +95,7 @@ class RunnerTests(OESelftestTestCase):
                 "applications": {'a1': 'file'},
                 "terminals": {},
                 "args": ['--extra-arg'],
+                "env": {"FOO": "BAR"}
             }))
=20
             m.assert_called_once_with('/usr/bin/FVP_Binary',
@@ -106,4 +105,5 @@ class RunnerTests(OESelftestTestCase):
                 '--extra-arg',
                 stdin=3Dunittest.mock.ANY,
                 stdout=3Dunittest.mock.ANY,
-                stderr=3Dunittest.mock.ANY)
+                stderr=3Dunittest.mock.ANY,
+                env=3D{"FOO":"BAR"})
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.json b/met=
a-arm/lib/oeqa/selftest/cases/tests/auto-basic.json
index 476eb572..a476ac10 100644
--- a/meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.json
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.json
@@ -1,3 +1,4 @@
 {
+    "fvp-bindir": ".",
     "exe": "auto-basic.sh"
 }
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/auto-parameters.json =
b/meta-arm/lib/oeqa/selftest/cases/tests/auto-parameters.json
index 0c7d4ef9..a60abac3 100644
--- a/meta-arm/lib/oeqa/selftest/cases/tests/auto-parameters.json
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/auto-parameters.json
@@ -1,4 +1,5 @@
 {
+    "fvp-bindir": ".",
     "exe": "test-parameters.py",
     "parameters": {
         "board.cow": "moo",
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/test-parameter.json b=
/meta-arm/lib/oeqa/selftest/cases/tests/test-parameter.json
index 9b565f27..031ef660 100644
--- a/meta-arm/lib/oeqa/selftest/cases/tests/test-parameter.json
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/test-parameter.json
@@ -1,4 +1,5 @@
 {
+    "fvp-bindir": ".",
     "exe": "test-parameters.py",
     "parameters": {
         "board.cow": "moo"
--=20
2.25.1


