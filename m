Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C075C678D8
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52028.1673521381626722855
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:03:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24879AD7;
	Thu, 12 Jan 2023 03:03:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9348A3F67D;
	Thu, 12 Jan 2023 03:03:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 03/10] arm-toolchain: remove obsolete oe_import
Date: Thu, 12 Jan 2023 11:02:50 +0000
Message-Id: <20230112110257.2070363-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4266

The oe_import() function was removed in oe-core when addpylib was
added[1]. However, meta-arm-toolchain doesn't ship any library code so
this call doesn't do anything useful anyway.

[1] 1f56155e91da2030ee0a5e93037c62e1349ba89f

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.i=
nc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 6d218919..71fac597 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -74,7 +74,6 @@ python toolchain_metadata_setup () {
=20
     d =3D e.data
     l =3D d.createCopy()
-    oe_import(l)
=20
     external_toolchain =3D l.getVar('EXTERNAL_TOOLCHAIN', True)
     if not external_toolchain or external_toolchain =3D=3D 'UNDEFINED':
--=20
2.34.1


