Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9410DC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 15:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9622.1634743534371305251
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 08:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1028913D5
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACBAA3F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][master 5/5] arm-bsp/musca*: update trusted-firmware-m
 platform names
Date: Wed, 20 Oct 2021 16:25:22 +0100
Message-Id: <20211020152522.415448-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020152522.415448-1-ross.burton@arm.com>
References: <20211020152522.415448-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 15:25:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2284

With trusted-firmware-m 1.4 the platform names have changed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf | 2 +-
 meta-arm-bsp/conf/machine/musca-s1.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index fa1264ec..073c466e 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -25,4 +25,4 @@ ZEPHYR_BOARD =3D "v2m_musca_b1"
 ZEPHYR_INHERIT_CLASSES +=3D "zephyr-qemuboot"
 ARCH:musca-b1 =3D "arm"
=20
-TFM_PLATFORM =3D "musca_b1/sse_200"
+TFM_PLATFORM =3D "arm/musca_b1/sse_200"
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/=
machine/musca-s1.conf
index d71cdfec..be15c60e 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -9,4 +9,4 @@ require conf/machine/include/arm/armv8-m/tune-cortexm33.i=
nc
 # GLIBC will not work with Cortex-M.
 TCLIBC =3D "newlib"
=20
-TFM_PLATFORM =3D "musca_s1"
+TFM_PLATFORM =3D "arm/musca_s1"
--=20
2.25.1


