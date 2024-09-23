Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602F7CF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 16:03:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40493.1727107396635189600
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Sep 2024 09:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E39EFEC
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Sep 2024 09:03:45 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56D9F3F528
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Sep 2024 09:03:15 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/lib: Handle timeout for spawn object on stop()
Date: Mon, 23 Sep 2024 17:03:01 +0100
Message-Id: <20240923160301.3137326-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Sep 2024 16:03:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6098

The current code is waiting 5 seconds to get an EOF on the
console pexpect spawn object, on a particularly slow machine
this timeout was not enough ending up into a TIMEOUT exception.

To solve this, increase the timeout and handle the TIMEOUT exception
by printing an error on the debug console instead of letting the
exception raise up to the stack, force the spawn object close() call
as well, since at this stage we would like the process to terminate
anyway.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 meta-arm/lib/fvp/runner.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index e7c1358553a7..4e414e995de2 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -134,8 +134,14 @@ class FVPRunner:
         for console in self._pexpects:
             import pexpect
             # Ensure pexpect logs all remaining output to the logfile
-            console.expect(pexpect.EOF, timeout=3D5.0)
-            console.close()
+            try:
+                console.expect(pexpect.EOF, timeout=3D30.0)
+            except pexpect.TIMEOUT:
+                pexpect_logfile =3D ""
+                if console.logfile is not None:
+                    pexpect_logfile =3D f" ({console.logfile})"
+                self._logger.debug(f"Unable to get EOF on pexpect spawn =
obj{pexpect_logfile}.")
+            console.close(force=3DTrue)
=20
         if self._fvp_process and self._fvp_process.returncode and \
                 self._fvp_process.returncode > 0:
--=20
2.34.1


