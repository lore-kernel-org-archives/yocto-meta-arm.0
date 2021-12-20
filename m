Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36302C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 17:13:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7943.1640020420553957609
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 09:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39321ED1
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFF253F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] runfvp: add an asyncio TODO
Date: Mon, 20 Dec 2021 17:13:32 +0000
Message-Id: <20211220171337.877288-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220171337.877288-1-ross.burton@arm.com>
References: <20211220171337.877288-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 17:13:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2742

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runfvp b/scripts/runfvp
index 66a76cc5..524de24d 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -205,6 +205,7 @@ def runfvp(cli_args):
             telnet =3D await asyncio.create_subprocess_exec("telnet", "l=
ocalhost", str(port), stdin=3Dsys.stdin, stdout=3Dsys.stdout)
             await telnet.wait()
             logger.debug(f"Telnet quit, cancelling tasks")
+            # TODO: this is 3.7+
             for t in asyncio.all_tasks():
                 logger.debug(f"Cancelling {t}")
                 t.cancel()
--=20
2.25.1


