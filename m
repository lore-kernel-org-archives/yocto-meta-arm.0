Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9327CCA482
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:28:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7535.1657621733603167925
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 03:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995B51A9A;
	Tue, 12 Jul 2022 03:28:53 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8459F3F792;
	Tue, 12 Jul 2022 03:28:52 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 4/6] arm/classes: Change FVP_CONSOLE to FVP_CONSOLES in
 fvpconf
Date: Tue, 12 Jul 2022 11:28:28 +0100
Message-Id: <20220712102830.625090-5-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712102830.625090-1-peter.hoyes@arm.com>
References: <20220712102830.625090-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 10:28:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3558

From: Peter Hoyes <Peter.Hoyes@arm.com>

So that the test target can connect to the desired console(s) as soon
as they appear in the FVP stdout, add the variable FVP_CONSOLES to the
fvpconf as a replcaement for FVP_CONSOLE. The varflags of this variable
define a mapping between FVP console names (e.g. terminal_0) and console
names in the tests (e.g. 'zephyr'). The console defined in
FVP_CONSOLE is automatically mapped as 'default' for backwards
compatibility.

This also enables greater reuse of test cases, as the "default" console
name can be remapped on a per-machine basis.

Issue-Id: SCM-4957
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I9d88b172bfc5a5459b9f5132f287c70816d7fb55
---
 meta-arm/classes/fvpboot.bbclass           | 5 ++++-
 meta-arm/lib/fvp/conffile.py               | 2 +-
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 2 +-
 scripts/runfvp                             | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index d02742d..ec9d4f5 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -18,6 +18,9 @@ FVP_APPLICATIONS ?=3D ""
 FVP_TERMINALS ?=3D ""
 # What terminal should be considered the primary console
 FVP_CONSOLE ?=3D ""
+# Flags for console names, as they appear in the FVP output. Flag name i=
s an
+# application-specific id for the console for use in test cases
+FVP_CONSOLES[default] ?=3D "${FVP_CONSOLE}"
 # Arbitrary extra arguments
 FVP_EXTRA_ARGS ?=3D ""
=20
@@ -59,7 +62,7 @@ python do_write_fvpboot_conf() {
     data["parameters"] =3D getFlags("FVP_CONFIG")
     data["data"] =3D shlex.split(d.getVar("FVP_DATA") or "")
     data["applications"] =3D getFlags("FVP_APPLICATIONS")
-    data["console"] =3D d.getVar("FVP_CONSOLE")
+    data["consoles"] =3D getFlags("FVP_CONSOLES")
     data["terminals"] =3D getFlags("FVP_TERMINALS")
     data["args"] =3D shlex.split(d.getVar("FVP_EXTRA_ARGS") or "")
=20
diff --git a/meta-arm/lib/fvp/conffile.py b/meta-arm/lib/fvp/conffile.py
index 77afca1..acede40 100644
--- a/meta-arm/lib/fvp/conffile.py
+++ b/meta-arm/lib/fvp/conffile.py
@@ -50,7 +50,7 @@ def load(config_file):
     sanitise("applications", {})
     sanitise("terminals", {})
     sanitise("args", [])
-    sanitise("console", "")
+    sanitise("consoles", {})
=20
     if not config["exe"]:
         raise ValueError("Required value FVP_EXE not set in machine conf=
iguration")
diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
index aabd0b7..d1e452f 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -78,7 +78,7 @@ class ConfFileTests(OESelftestTestCase):
             self.assertTrue("applications" in conf)
             self.assertTrue("terminals" in conf)
             self.assertTrue("args" in conf)
-            self.assertTrue("console" in conf)
+            self.assertTrue("consoles" in conf)
=20
=20
 class RunnerTests(OESelftestTestCase):
diff --git a/scripts/runfvp b/scripts/runfvp
index 30eae40..9fb77d3 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -55,7 +55,7 @@ async def start_fvp(args, config, extra_args):
=20
         if args.console:
             fvp.add_line_callback(lambda line: logger.debug(f"FVP output=
: {line}"))
-            expected_terminal =3D config["console"]
+            expected_terminal =3D config["consoles"]["default"]
             if not expected_terminal:
                 logger.error("--console used but FVP_CONSOLE not set in =
machine configuration")
                 return 1
--=20
2.25.1


