Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F52FC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:31:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32893.1635172302213231935
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 07:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72C081063
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 07:31:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E9823F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 07:31:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/fvp-library: upgrade to 11.15_14
Date: Mon, 25 Oct 2021 15:31:35 +0100
Message-Id: <20211025143135.2058165-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025143135.2058165-1-ross.burton@arm.com>
References: <20211025143135.2058165-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 14:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2295

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-library.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-library.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-library.bb
index 13bf7785..ab1de8c3 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-library.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-library.bb
@@ -2,12 +2,12 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Library"
 MODEL_CODE =3D "FVP_ARM_Std_Library"
-PV =3D "11.14_21"
+PV =3D "11.15_14"
=20
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3Da=
50d186fffa51ed55599183aad911298 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
b40ecbbbd3409d48263437b782df6df9"
+                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
=20
=20
 # The FVP Library tarball cannot be downloaded directly, so download the=
 it
--=20
2.25.1


