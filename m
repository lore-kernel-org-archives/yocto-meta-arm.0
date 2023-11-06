Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A76EC4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.57725.1699286358175457982
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 07:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F238C15;
	Mon,  6 Nov 2023 08:00:01 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B19523F703;
	Mon,  6 Nov 2023 07:59:16 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] scripts/runfvp: exit code should be the FVP exit code
Date: Mon,  6 Nov 2023 15:59:13 +0000
Message-Id: <20231106155914.2552807-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106155914.2552807-1-ross.burton@arm.com>
References: <20231106155914.2552807-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Nov 2023 15:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5210

From: Ross Burton <ross.burton@arm.com>

The __main__ body used the return value of runfvp() as the exit code,
but this was never set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 0ca3a1b5..135cf04d 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -79,7 +79,7 @@ def start_fvp(args, fvpconf, extra_args):
                 print(line.strip().decode(errors=3D'ignore'))
=20
     finally:
-        fvp.stop()
+        return fvp.stop()
=20
=20
 def runfvp(cli_args):
@@ -88,7 +88,7 @@ def runfvp(cli_args):
         config_file =3D args.config
     else:
         config_file =3D conffile.find(args.config)
-    start_fvp(args, config_file, extra_args)
+    return start_fvp(args, config_file, extra_args)
=20
=20
 if __name__ =3D=3D "__main__":
--=20
2.34.1


