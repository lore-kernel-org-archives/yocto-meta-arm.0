Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ECFC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 13:36:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8037.1790256958818526381
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=N8UfsfYS;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E9C1476
	for <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2026 06:35:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2F423F86F
	for <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2026 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790256958; bh=9vhgDo/B/rLAJxj/xyHYDECRs1/hkVGJtnoM/8lJFZU=;
	h=From:To:Subject:Date:From;
	b=N8UfsfYSFMDqrzTqCm3HSjwuiVMTWmq12mvE6pJG/4P2mTkUzMI/A/jAnetxWsBIb
	 pOeTErGU4cs+s8kKuqVOdZrXr9UtE3IlKdSxLFoCKFvFURls0fJhJ7xMK1wi+cPNye
	 tr58peXTAAx2l2dAy4QC8RYubUhKup5LbFjbN28o=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] meta-*: change layer compatibility to blacksail
Date: Thu, 24 Sep 2026 14:35:54 +0100
Message-ID: <20260924133554.689864-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2026 13:36:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7174

The upcoming 6.1 release is codenamed blacksail, so set that as the
layer compatibility.  We can't also claim to be compatible with wrynose
as apart from potential dependency issues, the LICENSE changes mean this
layer will not parse successfully.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index eb795f23540..0b60d5f7c5c 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp =3D "5"
=20
-LAYERSERIES_COMPAT_meta-arm-bsp =3D "wrynose"
+LAYERSERIES_COMPAT_meta-arm-bsp =3D "blacksail"
=20
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index 12272da1f90..8fdcf524038 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain =3D "5"
=20
 LAYERDEPENDS_arm-toolchain =3D "core"
-LAYERSERIES_COMPAT_arm-toolchain =3D "wrynose"
+LAYERSERIES_COMPAT_arm-toolchain =3D "blacksail"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index c783846dcca..9d5112e817b 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm =3D "wrynose"
+LAYERSERIES_COMPAT_meta-arm =3D "blacksail"
=20
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL +=3D "telnet"
--=20
2.43.0


