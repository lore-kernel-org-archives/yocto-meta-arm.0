Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B73CCCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 10:49:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16499.1760266146354573006
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Oct 2025 03:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A121F152B
	for <meta-arm@lists.yoctoproject.org>; Sun, 12 Oct 2025 03:48:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A1963F66E
	for <meta-arm@lists.yoctoproject.org>; Sun, 12 Oct 2025 03:49:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/oeqa/fvp: update for new ignore_ssh_fails argument to run()
Date: Sun, 12 Oct 2025 11:49:00 +0100
Message-ID: <20251012104900.2505243-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Oct 2025 10:49:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6730

The OESSHTarget object now has a ignore_ssh_fails keyword argument[1],
so update this subclass to match.

As the implementation of run() here simply forwards the arguments, we
can use *args, **kwargs so that future changes don't cause problems.

[1] oe-core afe118d4f2d ("oeqa: target: ssh: Fail on SSH error even when =
errors are ignored")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index dddc10ee3a..9ded121321 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -76,10 +76,10 @@ class OEFVPTarget(OESSHTarget):
     def stop(self, **kwargs):
         self.transition(OEFVPTargetState.OFF)
=20
-    def run(self, cmd, timeout=3DNone):
+    def run(self, *args, **kwargs):
         # Running a command implies the LINUX state
         self.transition(OEFVPTargetState.LINUX)
-        return super().run(cmd, timeout)
+        return super().run(*args, **kwargs)
=20
     def _setup_consoles(self):
         with open(self.fvp_log.name, 'rb') as logfile:
--=20
2.43.0


