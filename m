Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FADC4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 09:29:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5166.1665739744774334417
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 02:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C361424;
	Fri, 14 Oct 2022 02:29:09 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.82.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF4423F67D;
	Fri, 14 Oct 2022 02:29:02 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm/lib: Do not log FVP return codes < 0
Date: Fri, 14 Oct 2022 10:28:23 +0100
Message-Id: <20221014092823.2888861-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 09:29:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3962

From: Peter Hoyes <Peter.Hoyes@arm.com>

If a process is terminated using a signal, in Python its return code is
-N, where N is the signal number (e.g. -15 for SIGTERM). Currently, all
non-zero return codes are printed using logger.info, which gives the
impression of an abnormal termination even when the process was
explicitly terminated by FVPRunner.

Instead, only log return codes greater than zero.

Issue-Id: SCM-5314
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I1a1e9d8aa3f26c14b48be718498bcb14707950b7
---
 meta-arm/lib/fvp/runner.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index c5c795dd..28351a39 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -108,7 +108,10 @@ class FVPRunner:
             console.expect(pexpect.EOF, timeout=3D5.0)
             console.close()
=20
-        if self._fvp_process and self._fvp_process.returncode:
+        if self._fvp_process and self._fvp_process.returncode and \
+                self._fvp_process.returncode > 0:
+            # Return codes < 0 indicate that the process was explicitly
+            # terminated above.
             self._logger.info(f"FVP quit with code {self._fvp_process.re=
turncode}")
             return self._fvp_process.returncode
         else:
--=20
2.25.1


