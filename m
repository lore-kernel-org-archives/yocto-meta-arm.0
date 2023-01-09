Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2345C61DB3
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 17:20:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78789.1673284828170500735
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 09:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50AE31655;
	Mon,  9 Jan 2023 09:21:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE8473F587;
	Mon,  9 Jan 2023 09:20:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/4] arm/fvp-base-a-aem: add support for aarch64 binaries
Date: Mon,  9 Jan 2023 17:20:21 +0000
Message-Id: <20230109172022.2280271-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109172022.2280271-1-ross.burton@arm.com>
References: <20230109172022.2280271-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 17:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4246

There is now a beta release of the Base-A AEM FVP for aarch64!

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
index 85c752bc..4c62822e 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
=20
+SRC_URI[fvp-aarch64.sha256sum] =3D "e14e6cbd5c3ec8e1e2e79965e994c9235e13=
6480e102f5c43de31162263b6361"
 SRC_URI[fvp-x86_64.sha256sum] =3D "f9db2076e3a63e2f8eb2ea9ed60f30db04e5f=
81f535bc7e3ed24e270d857ea6f"
=20
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
+
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
--=20
2.34.1


