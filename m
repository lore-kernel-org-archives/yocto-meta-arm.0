Return-Path: <delane.brandy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B5DC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 10:51:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9187.1709722266378629595
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 02:51:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: delane.brandy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0896B1FB;
	Wed,  6 Mar 2024 02:51:43 -0800 (PST)
Received: from e127094.cambridge.arm.com (e127094.arm.com [10.1.39.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B7F63F738;
	Wed,  6 Mar 2024 02:51:04 -0800 (PST)
From: delane.brandy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Delane Brandy <delane.brandy@arm.com>
Subject: [PATCH 1/2] arm/trusted-firmware-a: fix mbedTLS version
Date: Wed,  6 Mar 2024 10:50:14 +0000
Message-Id: <20240306105015.2630056-2-delane.brandy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306105015.2630056-1-delane.brandy@arm.com>
References: <20240306105015.2630056-1-delane.brandy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Mar 2024 10:51:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5413

From: Delane Brandy <delane.brandy@arm.com>

Update mbedTLS version as TF-A 2.10 supports mbedTLS 3.4.1, as seen:
https://trustedfirmware-a.readthedocs.io/en/v2.10/change-log.html#new-fea=
tures

Signed-off-by: Delane Brandy <delane.brandy@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_2.10.0.bb         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
0.0.bb
index 4f019844..d25c0aaa 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.b=
b
@@ -5,8 +5,8 @@ SRCREV_tfa =3D "b6c0948400594e3cc4dbb5a4ef04b815d2675808"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
-# mbedtls-3.5.1
+# mbedtls-3.4.1
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
-SRCREV_mbedtls =3D "edb8fec9882084344a314368ac7fd957a187519c"
+SRCREV_mbedtls =3D "72718dd87e087215ce9155a826ee5a66cfbe9631"
=20
-LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.34.1


