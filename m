Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74BCC2BBCA
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:41:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89910.1718725293460892126
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 08:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2EEADA7
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 08:41:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB3213F6A8
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 08:41:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/libts: use UNPACKDIR
Date: Tue, 18 Jun 2024 15:41:29 +0000
Message-Id: <20240618154129.456464-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618154129.456464-1-ross.burton@arm.com>
References: <20240618154129.456464-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 15:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5827

Single files in SRC_URI are now in UNPACKDIR not WORKDIR.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/trusted-services/libts_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/me=
ta-arm/recipes-security/trusted-services/libts_git.bb
index 789bde7c..dfcd4bde 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -19,7 +19,7 @@ TEE_GROUP_NAME ?=3D "teeclnt"
 do_install:append () {
     if ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-m=
dev', 'false', 'true', d)}; then
         install -d ${D}${nonarch_base_libdir}/udev/rules.d/
-        install -m 755 ${WORKDIR}/tee-udev.rules ${D}${nonarch_base_libd=
ir}/udev/rules.d/
+        install -m 755 ${UNPACKDIR}/tee-udev.rules ${D}${nonarch_base_li=
bdir}/udev/rules.d/
         sed -i -e "s/teeclnt/${TEE_GROUP_NAME}/" ${D}${nonarch_base_libd=
ir}/udev/rules.d/tee-udev.rules
     fi
=20
--=20
2.34.1


