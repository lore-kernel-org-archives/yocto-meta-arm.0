Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C70C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:20:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22248.1742995205005779720
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 027811424
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 06:20:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DF9E3F58B
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 06:20:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][styhead] arm/fvp-base-a-aem: update SRC_URI
Date: Wed, 26 Mar 2025 13:19:59 +0000
Message-ID: <20250326131959.422592-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:20:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6412

developer.arm.com has a reorganisation and whilst most paths have a
redirect in place, the older FVP binaries did not.  Update the URL for
this FVP to the new canonical URLs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb
index 54c7e0fd..75b8d3c1 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.26.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
                     file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf66=
64c51f9075c5b"
=20
=20
-SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/Fixed-V=
irtual-Platforms/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;=
subdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=
=3D${BP};name=3Dfvp-${HOST_ARCH}"
 SRC_URI[fvp-aarch64.sha256sum] =3D "0a262327073d410146a6689c068162f60e72=
f45845734650b08a1d45483853ca"
 SRC_URI[fvp-x86_64.sha256sum] =3D "a314f0f8c55492b70ab469fbbe2bb71ab8bb7=
c7ae4608ed1c432d8de8f4edb27"
=20
--=20
2.43.0


