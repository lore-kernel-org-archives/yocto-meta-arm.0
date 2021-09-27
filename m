Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C74C433FE
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:56:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.30751.1632747367571683995
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 05:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B97A11FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 461E83F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] runfvp: handle control-c cleanly
Date: Mon, 27 Sep 2021 13:55:59 +0100
Message-Id: <20210927125602.3400822-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927125602.3400822-1-ross.burton@arm.com>
References: <20210927125602.3400822-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 12:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2232

If the script receives control-c, don't display the stack trace.

Change-Id: Id0ebf9476ecd685302723fde6a36c2e899d0f3eb
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index be047689..52d8f20b 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -164,4 +164,7 @@ def runfvp(args):
         sys.exit(subprocess.run(cli).returncode)
=20
 if __name__ =3D=3D "__main__":
-    runfvp(sys.argv)
+    try:
+        runfvp(sys.argv)
+    except KeyboardInterrupt:
+        pass
--=20
2.25.1


