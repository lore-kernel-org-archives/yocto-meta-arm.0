Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4E4C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.58439.1699286357536865986
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 07:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD4B61FB;
	Mon,  6 Nov 2023 08:00:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0AE4A3F703;
	Mon,  6 Nov 2023 07:59:15 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm/lib/fvp/runner: don't pass '' as cwd
Date: Mon,  6 Nov 2023 15:59:12 +0000
Message-Id: <20231106155914.2552807-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Nov 2023 15:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5209

From: Ross Burton <ross.burton@arm.com>

Don't pass "" as the cwd as that fails, use None so the cwd doesn't get
changed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/fvp/runner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 7ca3673d..e7c13585 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -100,7 +100,7 @@ class FVPRunner:
                 env[name] =3D os.environ[name]
=20
         # Allow filepath to be relative to fvp configuration file
-        cwd =3D os.path.dirname(fvpconf)
+        cwd =3D os.path.dirname(fvpconf) or None
         self._logger.debug(f"FVP call will be executed in working direct=
ory: {cwd}")
=20
         self._logger.debug(f"Constructed FVP call: {shlex_join(cli)}")
--=20
2.34.1


