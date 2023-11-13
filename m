Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17EAC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 13:31:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.36538.1699882262852794636
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 05:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9E81FEC;
	Mon, 13 Nov 2023 05:31:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D25493F7B4;
	Mon, 13 Nov 2023 05:31:01 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm/optee: handle CVE-2021-36133 as disputed
Date: Mon, 13 Nov 2023 13:30:59 +0000
Message-Id: <20231113133100.2200065-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 13:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5230

From: Ross Burton <ross.burton@arm.com>

This CVE is specific to NXP i.MX boards which are documented as being
shipped unsecure, as they're meant for development.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index 06c67cfb..650f8d0b 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -31,3 +31,6 @@ EXTRA_OEMAKE +=3D "V=3D1 \
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
 # right path until this is relocated automatically.
 export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
+
+# See the rationale in https://github.com/f-secure-foundry/advisories/bl=
ob/master/Security_Advisory-Ref_FSC-HWSEC-VR2021-0001-OP-TEE_TrustZone_by=
pass.txt.
+CVE_STATUS[CVE-2021-36133] =3D "disputed: devices shipped open for devel=
opment purposes"
--=20
2.34.1


