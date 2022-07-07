Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24A1C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:49:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3353.1657183754146138843
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 01:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 935191063;
	Thu,  7 Jul 2022 01:49:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDC663F792;
	Thu,  7 Jul 2022 01:49:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] runfvp: ignore setpgid errors when spawned
Date: Thu,  7 Jul 2022 09:49:05 +0100
Message-Id: <20220707084905.1914073-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Jul 2022 08:49:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3551

From: Bertrand Marquis <bertrand.marquis@arm.com>

When runfvp is spawned from an other process (for example except), it is
throwing a permission error.
To solve the problem, surround the call to setpgid with a try/except and
ignore the permission errors.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 scripts/runfvp | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 0ebf873e..7a3c239a 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -270,7 +270,12 @@ if __name__ =3D=3D "__main__":
     try:
         # Set the process group so that it's possible to kill runfvp and
         # everything it spawns easily.
-        os.setpgid(0, 0)
+        # Ignore permission errors happening when spawned from an other =
process
+        # for example run from except
+        try:
+            os.setpgid(0, 0)
+        except PermissionError:
+            pass
         if sys.stdin.isatty():
             signal.signal(signal.SIGTTOU, signal.SIG_IGN)
             os.tcsetpgrp(sys.stdin.fileno(), os.getpgrp())
--=20
2.25.1


