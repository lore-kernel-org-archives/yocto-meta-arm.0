Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02618C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:31:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.738.1648751482552970124
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4485B13D5
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAD733F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm/oeqa: add basic runfvp test cases
Date: Thu, 31 Mar 2022 19:31:14 +0100
Message-Id: <20220331183117.22389-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331183117.22389-1-ross.burton@arm.com>
References: <20220331183117.22389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:31:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3220

Add rudimentary but functional test cases for runfvp.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/selftest/cases/runfvp.py    | 51 +++++++++++++++++++
 .../oeqa/selftest/cases/tests/auto-basic.json |  3 ++
 .../oeqa/selftest/cases/tests/auto-basic.sh   | 11 ++++
 .../selftest/cases/tests/auto-parameters.json |  7 +++
 .../lib/oeqa/selftest/cases/tests/mock-fvp.py | 22 ++++++++
 .../selftest/cases/tests/test-parameter.json  |  6 +++
 .../selftest/cases/tests/test-parameters.py   |  1 +
 7 files changed, 101 insertions(+)
 create mode 100644 meta-arm/lib/oeqa/selftest/cases/runfvp.py
 create mode 100644 meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.jso=
n
 create mode 100755 meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.sh
 create mode 100644 meta-arm/lib/oeqa/selftest/cases/tests/auto-parameter=
s.json
 create mode 100755 meta-arm/lib/oeqa/selftest/cases/tests/mock-fvp.py
 create mode 100644 meta-arm/lib/oeqa/selftest/cases/tests/test-parameter=
.json
 create mode 120000 meta-arm/lib/oeqa/selftest/cases/tests/test-parameter=
s.py

diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
new file mode 100644
index 00000000..5b06ca8e
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -0,0 +1,51 @@
+import os
+import pathlib
+import subprocess
+
+from oeqa.selftest.case import OESelftestTestCase
+
+runfvp =3D pathlib.Path(__file__).parents[5] / "scripts" / "runfvp"
+testdir =3D pathlib.Path(__file__).parent / "tests"
+
+class RunFVPTests(OESelftestTestCase):
+    def setUpLocal(self):
+        self.assertTrue(runfvp.exists())
+
+    def run_fvp(self, *args, should_succeed=3DTrue):
+        """
+        Call runfvp passing any arguments. If check is True verify retur=
n stdout
+        on exit code 0 or fail the test, otherwise return the CompletedP=
rocess
+        instance.
+        """
+        # Put the test directory in PATH so that any mock FVPs are found=
 first
+        newenv =3D {"PATH": str(testdir) + ":" + os.environ["PATH"]}
+        cli =3D [runfvp,] + list(args)
+        print(f"Calling {cli}")
+        ret =3D subprocess.run(cli, env=3Dnewenv, stdout=3Dsubprocess.PI=
PE, stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
+        if should_succeed:
+            self.assertEqual(ret.returncode, 0, f"runfvp exit {ret.retur=
ncode}, output: {ret.stdout}")
+            return ret.stdout
+        else:
+            self.assertNotEqual(ret.returncode, 0, f"runfvp exit {ret.re=
turncode}, output: {ret.stdout}")
+            return ret.stdout
+
+    def test_help(self):
+        output =3D self.run_fvp("--help")
+        self.assertIn("Run images in a FVP", output)
+
+    def test_bad_options(self):
+        self.run_fvp("--this-is-an-invalid-option", should_succeed=3DFal=
se)
+
+    def test_run_auto_tests(self):
+        newenv =3D {"PATH": str(testdir) + ":" + os.environ["PATH"]}
+
+        cases =3D list(testdir.glob("auto-*.json"))
+        if not cases:
+            self.fail("No tests found")
+        for case in cases:
+            with self.subTest(case=3Dcase.stem):
+                self.run_fvp(case)
+
+    def test_fvp_options(self):
+        # test-parameter sets one argument, add another manually
+        self.run_fvp(testdir / "test-parameter.json", "--", "--parameter=
", "board.dog=3Dwoof")
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.json b/met=
a-arm/lib/oeqa/selftest/cases/tests/auto-basic.json
new file mode 100644
index 00000000..476eb572
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.json
@@ -0,0 +1,3 @@
+{
+    "exe": "auto-basic.sh"
+}
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.sh b/meta-=
arm/lib/oeqa/selftest/cases/tests/auto-basic.sh
new file mode 100755
index 00000000..ea9abac1
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/auto-basic.sh
@@ -0,0 +1,11 @@
+#! /bin/sh
+
+set -e -u
+
+if [ $# =3D 0 ]; then
+    echo No arguments as expected
+    exit 0
+else
+    echo Unexpected arguments: $*
+    exit 1
+fi
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/auto-parameters.json =
b/meta-arm/lib/oeqa/selftest/cases/tests/auto-parameters.json
new file mode 100644
index 00000000..0c7d4ef9
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/auto-parameters.json
@@ -0,0 +1,7 @@
+{
+    "exe": "test-parameters.py",
+    "parameters": {
+        "board.cow": "moo",
+        "board.dog": "woof"
+    }
+}
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/mock-fvp.py b/meta-ar=
m/lib/oeqa/selftest/cases/tests/mock-fvp.py
new file mode 100755
index 00000000..2213c9f0
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/mock-fvp.py
@@ -0,0 +1,22 @@
+#! /usr/bin/env python3
+
+import argparse
+import sys
+
+def do_test_parameters(args):
+    if not args.parameter or set(args.parameter) !=3D set(("board.cow=3D=
moo", "board.dog=3Dwoof")):
+        print(f"Unexpected arguments: {args}")
+        sys.exit(1)
+
+
+if __name__ =3D=3D "__main__":
+    parser =3D argparse.ArgumentParser()
+    parser.add_argument("-C", "--parameter", action=3D"append")
+    args =3D parser.parse_args()
+
+    function =3D "do_" + parser.prog.replace("-", "_").replace(".py", ""=
)
+    if function in locals():
+        locals()[function](args)
+    else:
+        print(f"Unknown mock mode {parser.prog}")
+        sys.exit(1)
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/test-parameter.json b=
/meta-arm/lib/oeqa/selftest/cases/tests/test-parameter.json
new file mode 100644
index 00000000..9b565f27
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/test-parameter.json
@@ -0,0 +1,6 @@
+{
+    "exe": "test-parameters.py",
+    "parameters": {
+        "board.cow": "moo"
+    }
+}
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/test-parameters.py b/=
meta-arm/lib/oeqa/selftest/cases/tests/test-parameters.py
new file mode 120000
index 00000000..c734eeca
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/test-parameters.py
@@ -0,0 +1 @@
+mock-fvp.py
\ No newline at end of file
--=20
2.25.1


