Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE35C433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 18:20:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.870.1638901202509536771
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 10:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 230DA11FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0AE73F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/trusted-firmware-a: add new recipe for 2.6
Date: Tue,  7 Dec 2021 18:19:55 +0000
Message-Id: <20211207181956.900131-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207181956.900131-1-ross.burton@arm.com>
References: <20211207181956.900131-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Dec 2021 18:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2558

Keeping 2.5 around temporarily until all of the machines are ported.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_2.6.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.6.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
new file mode 100644
index 00000000..ec1bec95
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
@@ -0,0 +1,12 @@
+require trusted-firmware-a.inc
+
+# TF-A v2.6
+SRCREV_tfa =3D "a1f02f4f3daae7e21ee58b4c93ec3e46b8f28d15"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
+
+# mbed TLS v2.26.0
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
+SRCREV_mbedtls =3D "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.25.1


