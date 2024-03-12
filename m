Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4534DC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 12:55:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8225.1710248108378192499
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 05:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEC471007
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Mar 2024 05:55:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C7A73F762
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Mar 2024 05:55:07 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm arm-bsp: enable patch-status warnings
Date: Tue, 12 Mar 2024 12:55:05 +0000
Message-Id: <20240312125505.1392948-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Mar 2024 12:55:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5422

From: Ross Burton <ross.burton@arm.com>

Enable the patch-status warning for meta-arm and meta-arm-bsp.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/layer.conf | 2 ++
 meta-arm/conf/layer.conf     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 543b8c23..9013d11f 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -24,3 +24,5 @@ BBFILES_DYNAMIC +=3D " \
     meta-arm-systemready:${LAYERDIR}/dynamic-layers/meta-arm-systemready=
/*/*/*.bb \
     meta-arm-systemready:${LAYERDIR}/dynamic-layers/meta-arm-systemready=
/*/*/*.bbappend \
 "
+
+WARN_QA:append:layer-meta-arm-bsp =3D " patch-status"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index af8275af..9e9c9dbd 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -19,3 +19,5 @@ LAYERSERIES_COMPAT_meta-arm =3D "nanbield scarthgap"
 HOSTTOOLS_NONFATAL +=3D "telnet"
=20
 addpylib ${LAYERDIR}/lib oeqa
+
+WARN_QA:append:layer-meta-arm =3D " patch-status"
--=20
2.34.1


