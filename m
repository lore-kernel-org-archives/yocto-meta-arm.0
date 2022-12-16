Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA0CC3DA6E
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 20:28:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5485.1671222475343484230
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 12:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3DBD1063;
	Fri, 16 Dec 2022 12:28:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 786303F71E;
	Fri, 16 Dec 2022 12:27:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/4] arm/fvp-base-a-aem: upgrade to 11.20.15
Date: Fri, 16 Dec 2022 20:27:49 +0000
Message-Id: <20221216202751.1031059-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216202751.1031059-1-ross.burton@arm.com>
References: <20221216202751.1031059-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 20:28:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4203

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{fvp-base-a-aem_11.18.16.bb =3D> fvp-base-a-aem_11.20.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.18.16.bb =3D> fv=
p-base-a-aem_11.20.15.bb} (86%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.18.16.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
similarity index 86%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.18.16.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
index 4d8519e3..6545a6ef 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.18.16.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
=20
-SRC_URI[sha256sum] =3D "fe76f9ff217a44ed7680a0a6ccd6bd19758f5e0466ff98cc=
d82b2ae62289b9fe"
+SRC_URI[sha256sum] =3D "f9db2076e3a63e2f8eb2ea9ed60f30db04e5f81f535bc7e3=
ed24e270d857ea6f"
=20
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
--=20
2.34.1


