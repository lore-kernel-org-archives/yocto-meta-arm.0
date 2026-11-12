Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6876.1794520241567763320
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 13:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F5DC407E4
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2026 21:50:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmTCyzZD69LW for <meta-arm@lists.yoctoproject.org>;
	Thu, 12 Nov 2026 21:50:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5508D407E1
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2026 21:50:40 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6F02817622B;
	Thu, 12 Nov 2026 16:50:39 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] optee-os-tadevkit: Allow empty SPDX deploy artifacts
Date: Thu, 12 Nov 2026 16:50:35 -0500
Message-Id: <20261112215035.1552514-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2026 21:50:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7217
Content-Type: text/plain; charset="utf-8"

OE-Core has added support for deploy tasks to create SPDX [0].
optee-os-tadevkit doesn't deploy anything and needs to set
SPDX_DEPLOY_ALLOW_EMPTY so that it doesn't generate an error,
similar to [1].

[0] https://git.openembedded.org/openembedded-core/commit/?id=3D1b77fe51e=
c77ae0bdea016fe4bbe76ac73b1f3d1
[1] https://git.openembedded.org/openembedded-core/commit/?id=3D34991d0ce=
3cc5f38dd29e824af7579512d2b917e

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb =
b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb
index cca9f62a..d4e8c81f 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.11.0.bb
@@ -19,6 +19,8 @@ do_deploy() {
 	echo "Do not inherit do_deploy from optee-os."
 }
=20
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D "1"
+
 FILES:${PN} =3D "${includedir}/optee/"
=20
 # Build paths are currently embedded
--=20
2.25.1

