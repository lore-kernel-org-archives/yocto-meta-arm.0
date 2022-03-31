Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACD9C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:31:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.704.1648751481561512589
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C1DF13D5
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D22D93F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] runfvp: check for telnet
Date: Thu, 31 Mar 2022 19:31:12 +0100
Message-Id: <20220331183117.22389-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331183117.22389-1-ross.burton@arm.com>
References: <20220331183117.22389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3218

Check for telnet on startup to avoid mysterious failures later when
telnet isn't available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 5cab0949..0ebf873e 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -5,6 +5,7 @@ import collections
 import json
 import os
 import re
+import shutil
 import signal
 import sys
 import subprocess
@@ -42,7 +43,7 @@ class Terminals:
         return config.get("RunFVP", "Terminal", fallback=3DNone)
=20
     def preferred_terminal(self) -> str:
-        import shlex, shutil
+        import shlex
=20
         preferred =3D self.configured_terminal()
         if preferred:
@@ -233,6 +234,11 @@ def runfvp(cli_args):
     cli.extend(fvp_args)
     logger.debug(f"Constructed FVP call: {cli}")
=20
+    # Check that telnet is present
+    if not bool(shutil.which("telnet")):
+        logger.error("Cannot find telnet, this is needed to connect to t=
he FVP.")
+        return 1
+
     if args.console:
         expected_terminal =3D config["console"]
         if not expected_terminal:
--=20
2.25.1


