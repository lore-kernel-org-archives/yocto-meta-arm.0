Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E82C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 09:58:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8573.1664445505864505331
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 02:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 015B71477;
	Thu, 29 Sep 2022 02:58:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D80723F73B;
	Thu, 29 Sep 2022 02:58:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] runfvp: pass-through environment variables need for GUI
 applications
Date: Thu, 29 Sep 2022 10:58:20 +0100
Message-Id: <20220929095820.1066279-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 09:58:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3867

Since 820a55d3 the environment that the FVPs run in is limited, however
this broke the use of GUI applications for the terminals.

Passthrough DISPLAY and WAYLAND_DISPLAY automatically so these continue
to work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/fvp/runner.py                 | 10 +++++++++-
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 8c6b4cad..c5c795dd 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -59,11 +59,19 @@ class FVPRunner:
     async def start(self, config, extra_args=3D[], terminal_choice=3D"no=
ne"):
         cli =3D cli_from_config(config, terminal_choice)
         cli +=3D extra_args
+
+        # Pass through environment variables needed for GUI applications=
, such
+        # as xterm, to work.
+        env =3D config['env']
+        for name in ('DISPLAY', 'WAYLAND_DISPLAY'):
+            if name in os.environ:
+                env[name] =3D os.environ[name]
+
         self._logger.debug(f"Constructed FVP call: {cli}")
         self._fvp_process =3D await asyncio.create_subprocess_exec(
             *cli,
             stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.STDOUT,
-            env=3Dconfig['env'])
+            env=3Denv)
=20
         def detect_terminals(line):
             m =3D re.match(r"^(\S+): Listening for serial connection on =
port (\d+)$", line)
diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oe=
qa/selftest/cases/runfvp.py
index e1bf2040..cf8a3c53 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -107,3 +107,25 @@ class RunnerTests(OESelftestTestCase):
                 stdout=3Dunittest.mock.ANY,
                 stderr=3Dunittest.mock.ANY,
                 env=3D{"FOO":"BAR"})
+
+    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_DI=
SPLAY": "wayland-42"})
+    def test_env_passthrough(self):
+        from fvp import runner
+        with self.create_mock() as m:
+            fvp =3D runner.FVPRunner(self.logger)
+            asyncio.run(fvp.start({
+                "fvp-bindir": "/usr/bin",
+                "exe": "FVP_Binary",
+                "parameters": {},
+                "data": [],
+                "applications": {},
+                "terminals": {},
+                "args": [],
+                "env": {"FOO": "BAR"}
+            }))
+
+            m.assert_called_once_with('/usr/bin/FVP_Binary',
+                stdin=3Dunittest.mock.ANY,
+                stdout=3Dunittest.mock.ANY,
+                stderr=3Dunittest.mock.ANY,
+                env=3D{"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY":=
 "wayland-42"})
--=20
2.34.1


