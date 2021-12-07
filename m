Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7CDC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 18:20:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.862.1638901202252364977
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 10:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB6C143B
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:01 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3952E3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm-bsp/trusted-firmware-a: explicitly set the full PV
 for corstone1000
Date: Tue,  7 Dec 2021 18:19:54 +0000
Message-Id: <20211207181956.900131-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207181956.900131-1-ross.burton@arm.com>
References: <20211207181956.900131-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Dec 2021 18:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2556

The bbappend is fetching a specific SHA, so explicitly set the PV
to match.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 970a1cee..1a5bdd0c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -4,9 +4,9 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
 SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
=20
-# TF-A master branch with all Corstone1000 patches merged
+# TF-A master branch post 2.5 with all Corstone1000 patches merged
 SRCREV_tfa =3D "459b24451a0829460783ce8dfa15561e36d901d8"
-PV .=3D "+git${SRCREV_tfa}"
+PV =3D "2.5+git${SRCPV}"
=20
 LIC_FILES_CHKSUM=3D"file://docs/license.rst;md5=3Db2c740efedc159745b9b31=
f88ff03dde file://mbedtls/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
=20
--=20
2.25.1


