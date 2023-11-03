Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17238C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:57:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.63972.1699041435166214015
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 12:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6177D2F4;
	Fri,  3 Nov 2023 12:57:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 152E23F738;
	Fri,  3 Nov 2023 12:57:13 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/trusted-firmware-a: update mbedtls to recommended release
Date: Fri,  3 Nov 2023 19:57:10 +0000
Message-Id: <20231103195710.3829785-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Nov 2023 19:57:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5203

From: Ross Burton <ross.burton@arm.com>

The TF-A 2.9 documentation[1] says that mbedtls 3.4.0 is the recommended
release to use, so switch to that.

[1] https://trustedfirmware-a.readthedocs.io/en/v2.9/getting_started/prer=
equisites.html#software-and-libraries

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_2.9.0.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.9.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.=
0.bb
index 8f78b5e7..5e526958 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
@@ -10,8 +10,8 @@ SRC_URI:append:qemuarm64-secureboot =3D " \
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
-# mbed TLS v2.28.4
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.28"
-SRCREV_mbedtls =3D "aeb97a18913a86f051afab11b2c92c6be0c2eb83"
+# mbedtls-3.4.0
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
+SRCREV_mbedtls =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.34.1


