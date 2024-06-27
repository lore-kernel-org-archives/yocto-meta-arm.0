Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D87AC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 12:57:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7218.1719493068884316089
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 05:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37F44367;
	Thu, 27 Jun 2024 05:58:13 -0700 (PDT)
Received: from e133390.cambridge.arm.com (e133390.arm.com [10.1.36.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 660AB3F766;
	Thu, 27 Jun 2024 05:57:47 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ziad Elhanafy <ziad.elhanafy@arm.com>,
	Divin Raj <divin.raj@arm.com>
Subject: [PATCH] arm/oeqa: Enable pexpect profiling for testcase debugging
Date: Thu, 27 Jun 2024 13:57:00 +0100
Message-Id: <20240627125700.2406122-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jun 2024 12:57:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5846

From: Ziad Elhanafy <ziad.elhanafy@arm.com>

This patch enables logging with timestamps for individual pexpect
assertions to ease the debugging of failed tests and the tuning of
timeouts. It measures the execution time of all pexpect calls and logs
the actual duration for each.

Only "callable" pexpect calls are timed (e.g. expect, sendline, but not
before or after).

Signed-off-by: Divin Raj <divin.raj@arm.com>
Signed-off-by: Ziad Elhanafy <ziad.elhanafy@arm.com>
Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 80f72aab..dddc10ee 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -3,6 +3,7 @@ import enum
 import pathlib
 import pexpect
 import os
+import time
=20
 from oeqa.core.target.ssh import OESSHTarget
 from fvp import runner
@@ -127,9 +128,19 @@ class OEFVPTarget(OESSHTarget):
         def call_pexpect(terminal, *args, **kwargs):
             attr =3D getattr(self.terminals[terminal], name)
             if callable(attr):
-                return attr(*args, **kwargs)
+                self.logger.debug(f"Calling {name} on {terminal} : with =
arguments -> {args}  :  {kwargs}")
+                start_time =3D time.monotonic()  # Record the start time
+
+                attr =3D getattr(self.terminals[terminal], name)
+                result =3D attr(*args, **kwargs)
+
+                end_time =3D time.monotonic()  # Record the end time
+                elapsed_time =3D end_time - start_time
+                self.logger.debug(f"Execution time for result: [ {result=
} ] - elapsed_time: {elapsed_time} seconds")
             else:
-                return attr
+                result =3D attr
+
+            return result
=20
         return call_pexpect
=20
--=20
2.34.1


