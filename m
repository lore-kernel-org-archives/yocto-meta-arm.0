Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3BEC77B7F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 10:09:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.45761.1684318161185296826
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 May 2023 03:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cc+nxa+i;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f4249b7badso5959135e9.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684318159; x=1686910159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5TLftFXFpP/p66GV9b80VbXUpdSiL2BNzQS06tPmSWs=;
        b=cc+nxa+iT3TKK+IPHy5Rxs0FvitGqKKyX2/FJLRKxW59KqQ1YlgLrkc+YnFRs1tsC3
         6/AITeGXqkAlh72E1YeupddGbUQ76tpIxxSIG3kfqAR1Dcj1t2iXPMTuqeRxC5Ch7gvf
         9Ci6aXu0te5vBUmU9GW9BMztwH1uuu1Lzo0agrE87PCZYsz1Sy2ZZeSFQ5N0Lzm6RcMy
         58d3xBOoIAi/QbyhimxzUuAHqknmcCZX3vO2XWYjcUE51oPhiohNfDMTPwwaJ//m5bRg
         dihF1Ra1+J8MQNpeuaVd18seWDYJHdWLTFO2EDa5eI4cBJR/icHlpp5n3J8wc65Y04eJ
         lN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684318159; x=1686910159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TLftFXFpP/p66GV9b80VbXUpdSiL2BNzQS06tPmSWs=;
        b=e0OicWR/gfnTDFlO4GEMmSpY2fBHsclRMrp940N/emzjSjauzCxjUp033nlWDVXvHs
         kDakDoINQA6UchnHiSHhTiT5TPfBERuXX+O74YkuUWPxQXSOldRuaWRfnNtBDyjGFonD
         bfzOP66Fig1foD3yLiOL6fJEAZDLDYRFkWr2bcZpshhp+I9Px5d1MRkux9b90KqfbsbY
         K4oObzpTVPQF3Db2EZzuc3tKTTllzL8NEv7H2CyPavCbcIA36WtDfl+C4WhEtfCgT4Wm
         F3eMYQz0oJFPQeVL5bNPtovzXQqmRZjArwxFFKA1bLMI/xVUPiXsN18Pe0ZMWdcM4pXl
         CmuQ==
X-Gm-Message-State: AC+VfDzmJcb6RytS/KQ7vGfLYNYbcEV8WcLtFHoNb2k5Ed350LnMUYaj
	HtzsnvJtka8L/FgcZHtQ4lEx7pGHGsSxHQ==
X-Google-Smtp-Source: ACHHUZ5tRs3OLIARPF45Wf4YCaXaTghg68exTW47AYu1hwEYucNjSIgOWwWcBMeKC0wOKiolcVEMOQ==
X-Received: by 2002:a05:600c:2056:b0:3f4:2bbf:40a with SMTP id p22-20020a05600c205600b003f42bbf040amr19522430wmg.37.1684318158808;
        Wed, 17 May 2023 03:09:18 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id l5-20020a7bc445000000b003f42e008c8dsm1770392wmi.44.2023.05.17.03.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:09:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC PATCH v2 1/3] runfvp: make fvp runner to hold the config
Date: Wed, 17 May 2023 12:09:11 +0200
Message-Id: <20230517100913.96055-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 10:09:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4661

At the moment the config is load and pass to FVPRunner.

Change the ownership to FVPRunner.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-arm/lib/fvp/runner.py                 | 15 +++++--
 meta-arm/lib/oeqa/controllers/fvp.py       | 13 +++---
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 49 +++++++++++++---------
 scripts/runfvp                             | 11 +++--
 4 files changed, 52 insertions(+), 36 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index d957e780..4f5f88ca 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -6,7 +6,7 @@ import shutil
 import sys
 
 from .terminal import terminals
-
+from .conffile import load
 
 def cli_from_config(config, terminal_choice):
     cli = []
@@ -83,14 +83,18 @@ class FVPRunner:
         self._fvp_process = None
         self._telnets = []
         self._pexpects = []
+        self._config = None
+
+    def start(self, fvpconf, extra_args=[], terminal_choice="none", stdout=subprocess.PIPE):
+        self._logger.debug(f"Loading {fvpconf}")
+        self._config = load(fvpconf)
 
-    def start(self, config, extra_args=[], terminal_choice="none", stdout=subprocess.PIPE):
-        cli = cli_from_config(config, terminal_choice)
+        cli = cli_from_config(self._config, terminal_choice)
         cli += extra_args
 
         # Pass through environment variables needed for GUI applications, such
         # as xterm, to work.
-        env = config['env']
+        env = self._config['env']
         for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY', 'XAUTHORITY'):
             if name in os.environ:
                 env[name] = os.environ[name]
@@ -140,6 +144,9 @@ class FVPRunner:
     def wait(self, timeout):
         self._fvp_process.wait(timeout)
 
+    def getConfig(self):
+        return self._config
+
     @property
     def stdout(self):
         return self._fvp_process.stdout
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/controllers/fvp.py
index e8a094f1..38484072 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -3,7 +3,7 @@ import pexpect
 import os
 
 from oeqa.core.target.ssh import OESSHTarget
-from fvp import conffile, runner
+from fvp import runner
 
 
 class OEFVPSSHTarget(OESSHTarget):
@@ -19,7 +19,6 @@ class OEFVPSSHTarget(OESSHTarget):
         basename = pathlib.Path(rootfs)
         basename = basename.name.replace("".join(basename.suffixes), "")
         self.fvpconf = image_dir / (basename + ".fvpconf")
-        self.config = conffile.load(self.fvpconf)
         self.bootlog = bootlog
 
         if not self.fvpconf.exists():
@@ -31,7 +30,7 @@ class OEFVPSSHTarget(OESSHTarget):
     def start(self, **kwargs):
         self.fvp_log = self._create_logfile("fvp")
         self.fvp = runner.FVPRunner(self.logger)
-        self.fvp.start(self.config, stdout=self.fvp_log)
+        self.fvp.start(self.fvpconf, stdout=self.fvp_log)
         self.logger.debug(f"Started FVP PID {self.fvp.pid()}")
         self._after_start()
 
@@ -72,8 +71,9 @@ class OEFVPTarget(OEFVPSSHTarget):
     def _after_start(self):
         with open(self.fvp_log.name, 'rb') as logfile:
             parser = runner.ConsolePortParser(logfile)
-            self.logger.debug(f"Awaiting console on terminal {self.config['consoles']['default']}")
-            port = parser.parse_port(self.config['consoles']['default'])
+            config = self.fvp.getConfig()
+            self.logger.debug(f"Awaiting console on terminal {config['consoles']['default']}")
+            port = parser.parse_port(config['consoles']['default'])
             console = self.fvp.create_pexpect(port)
             try:
                 console.expect("login\\:", timeout=self.boot_timeout)
@@ -105,7 +105,8 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
     def _after_start(self):
         with open(self.fvp_log.name, 'rb') as logfile:
             parser = runner.ConsolePortParser(logfile)
-            for name, console in self.config["consoles"].items():
+            config = self.fvp.getConfig()
+            for name, console in config["consoles"].items():
                 logfile = self._create_logfile(name)
                 self.logger.info(f'Creating terminal {name} on {console}')
                 port = parser.parse_port(console)
diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
index 46941ca9..2d2cdc80 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -1,5 +1,6 @@
 import asyncio
 import os
+import json
 import pathlib
 import subprocess
 import tempfile
@@ -88,16 +89,20 @@ class RunnerTests(OESelftestTestCase):
         from fvp import runner
         with self.create_mock() as m:
             fvp = runner.FVPRunner(self.logger)
-            fvp.start({
-                "fvp-bindir": "/usr/bin",
-                "exe": "FVP_Binary",
-                "parameters": {'foo': 'bar'},
-                "data": ['data1'],
-                "applications": {'a1': 'file'},
-                "terminals": {},
-                "args": ['--extra-arg'],
-                "env": {"FOO": "BAR"}
-            })
+            config = {"fvp-bindir": "/usr/bin",
+                    "exe": "FVP_Binary",
+                    "parameters": {'foo': 'bar'},
+                    "data": ['data1'],
+                    "applications": {'a1': 'file'},
+                    "terminals": {},
+                    "args": ['--extra-arg'],
+                    "env": {"FOO": "BAR"}
+                     }
+
+            with tempfile.NamedTemporaryFile('w') as fvpconf:
+                json.dump(config, fvpconf)
+                fvpconf.flush()
+                fvp.start(fvpconf.name)
 
             m.assert_called_once_with(['/usr/bin/FVP_Binary',
                 '--parameter', 'foo=bar',
@@ -114,16 +119,20 @@ class RunnerTests(OESelftestTestCase):
         from fvp import runner
         with self.create_mock() as m:
             fvp = runner.FVPRunner(self.logger)
-            fvp.start({
-                "fvp-bindir": "/usr/bin",
-                "exe": "FVP_Binary",
-                "parameters": {},
-                "data": [],
-                "applications": {},
-                "terminals": {},
-                "args": [],
-                "env": {"FOO": "BAR"}
-            })
+            config = {"fvp-bindir": "/usr/bin",
+                      "exe": "FVP_Binary",
+                      "parameters": {},
+                      "data": [],
+                      "applications": {},
+                      "terminals": {},
+                      "args": [],
+                      "env": {"FOO": "BAR"}
+                     }
+
+            with tempfile.NamedTemporaryFile('w') as fvpconf:
+                json.dump(config, fvpconf)
+                fvpconf.flush()
+                fvp.start(fvpconf.name)
 
             m.assert_called_once_with(['/usr/bin/FVP_Binary'],
                 stdin=unittest.mock.ANY,
diff --git a/scripts/runfvp b/scripts/runfvp
index e4b00abc..c2e536c8 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -14,7 +14,7 @@ logger = logging.getLogger("RunFVP")
 libdir = pathlib.Path(__file__).parents[1] / "meta-arm" / "lib"
 sys.path.insert(0, str(libdir))
 
-from fvp import terminal, runner, conffile
+from fvp import terminal, runner
 
 def parse_args(arguments):
     import argparse
@@ -49,12 +49,13 @@ def parse_args(arguments):
     logger.debug(f"FVP arguments: {fvp_args}")
     return args, fvp_args
 
-def start_fvp(args, config, extra_args):
+def start_fvp(args, fvpconf, extra_args):
     fvp = runner.FVPRunner(logger)
     try:
-        fvp.start(config, extra_args, args.terminals)
+        fvp.start(fvpconf, extra_args, args.terminals)
 
         if args.console:
+            config = fvp.getConfig()
             expected_terminal = config["consoles"].get("default")
             if expected_terminal is None:
                 logger.error("--console used but FVP_CONSOLE not set in machine configuration")
@@ -87,9 +88,7 @@ def runfvp(cli_args):
         config_file = args.config
     else:
         config_file = conffile.find(args.config)
-    logger.debug(f"Loading {config_file}")
-    config = conffile.load(config_file)
-    start_fvp(args, config, extra_args)
+    start_fvp(args, config_file, extra_args)
 
 
 if __name__ == "__main__":
-- 
2.40.1


