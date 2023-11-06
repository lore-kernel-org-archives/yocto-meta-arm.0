Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF07C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.57726.1699286358223628403
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 07:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 187FADA7;
	Mon,  6 Nov 2023 08:00:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 646A23F703;
	Mon,  6 Nov 2023 07:59:17 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm/selftest: add test that DISPLAY is forwarded into the runfvp child
Date: Mon,  6 Nov 2023 15:59:14 +0000
Message-Id: <20231106155914.2552807-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106155914.2552807-1-ross.burton@arm.com>
References: <20231106155914.2552807-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Nov 2023 15:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5211

From: Ross Burton <ross.burton@arm.com>

Add an optional env argument to the run_fvp() function, and check that
DISPLAY is preserved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/selftest/cases/runfvp.py               | 9 ++++++---
 meta-arm/lib/oeqa/selftest/cases/tests/mock-fvp.py       | 7 +++++++
 .../lib/oeqa/selftest/cases/tests/test-environment.json  | 4 ++++
 .../lib/oeqa/selftest/cases/tests/test-environment.py    | 1 +
 4 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm/lib/oeqa/selftest/cases/tests/test-environme=
nt.json
 create mode 120000 meta-arm/lib/oeqa/selftest/cases/tests/test-environme=
nt.py

diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
index 61ce2ab9..c995f89e 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -1,4 +1,3 @@
-import asyncio
 import os
 import json
 import pathlib
@@ -17,7 +16,7 @@ class RunFVPTests(OESelftestTestCase):
     def setUpLocal(self):
         self.assertTrue(runfvp.exists())
=20
-    def run_fvp(self, *args, should_succeed=3DTrue):
+    def run_fvp(self, *args, env=3DNone, should_succeed=3DTrue):
         """
         Call runfvp passing any arguments. If check is True verify retur=
n stdout
         on exit code 0 or fail the test, otherwise return the CompletedP=
rocess
@@ -26,7 +25,7 @@ class RunFVPTests(OESelftestTestCase):
         cli =3D [runfvp,] + list(args)
         print(f"Calling {cli}")
         # Set cwd to testdir so that any mock FVPs are found
-        ret =3D subprocess.run(cli, cwd=3Dtestdir, stdout=3Dsubprocess.P=
IPE, stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
+        ret =3D subprocess.run(cli, cwd=3Dtestdir, env=3Denv, stdout=3Ds=
ubprocess.PIPE, stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
         if should_succeed:
             self.assertEqual(ret.returncode, 0, f"runfvp exit {ret.retur=
ncode}, output: {ret.stdout}")
             return ret.stdout
@@ -53,6 +52,10 @@ class RunFVPTests(OESelftestTestCase):
         # test-parameter sets one argument, add another manually
         self.run_fvp(testdir / "test-parameter.json", "--", "--parameter=
", "board.dog=3Dwoof")
=20
+    def test_fvp_environment(self):
+        output =3D self.run_fvp(testdir / "test-environment.json", env=3D=
{"DISPLAY": "test_fvp_environment:42"})
+        self.assertEqual(output.strip(), "Found expected DISPLAY")
+
 @OETestTag("meta-arm")
 class ConfFileTests(OESelftestTestCase):
     def test_no_exe(self):
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/mock-fvp.py b/meta-ar=
m/lib/oeqa/selftest/cases/tests/mock-fvp.py
index 2213c9f0..6cf8e454 100755
--- a/meta-arm/lib/oeqa/selftest/cases/tests/mock-fvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/mock-fvp.py
@@ -2,12 +2,19 @@
=20
 import argparse
 import sys
+import os
=20
 def do_test_parameters(args):
     if not args.parameter or set(args.parameter) !=3D set(("board.cow=3D=
moo", "board.dog=3Dwoof")):
         print(f"Unexpected arguments: {args}")
         sys.exit(1)
=20
+def do_test_environment(args):
+    if os.environ.get("DISPLAY") =3D=3D "test_fvp_environment:42":
+        print("Found expected DISPLAY")
+    else:
+        print("Got unexpected environment %s" % str(os.environ))
+        sys.exit(1)
=20
 if __name__ =3D=3D "__main__":
     parser =3D argparse.ArgumentParser()
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/test-environment.json=
 b/meta-arm/lib/oeqa/selftest/cases/tests/test-environment.json
new file mode 100644
index 00000000..6e23855b
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/test-environment.json
@@ -0,0 +1,4 @@
+{
+    "fvp-bindir": ".",
+    "exe": "test-environment.py"
+}
diff --git a/meta-arm/lib/oeqa/selftest/cases/tests/test-environment.py b=
/meta-arm/lib/oeqa/selftest/cases/tests/test-environment.py
new file mode 120000
index 00000000..c734eeca
--- /dev/null
+++ b/meta-arm/lib/oeqa/selftest/cases/tests/test-environment.py
@@ -0,0 +1 @@
+mock-fvp.py
\ No newline at end of file
--=20
2.34.1


