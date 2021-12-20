Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EE0C43217
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 17:13:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7999.1640020421713115514
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 09:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE344D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89EB23F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] runfvp: don't use f-string when there's no expressions
Date: Mon, 20 Dec 2021 17:13:35 +0000
Message-Id: <20211220171337.877288-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220171337.877288-1-ross.burton@arm.com>
References: <20211220171337.877288-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 17:13:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2746

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 77668248..fb334795 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -169,7 +169,7 @@ async def start_fvp(cli, console_cb):
=20
             # Look for serial connections opening
             if console_cb:
-                m =3D re.match(fr"^(\S+): Listening for serial connectio=
n on port (\d+)$", line)
+                m =3D re.match(r"^(\S+): Listening for serial connection=
 on port (\d+)$", line)
                 if m:
                     terminal =3D m.group(1)
                     port =3D int(m.group(2))
--=20
2.25.1


