Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5252.1631699875339855687
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 02:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A286D;
	Wed, 15 Sep 2021 02:57:53 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.40.243])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED9463F5A1;
	Wed, 15 Sep 2021 02:57:52 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/fvp-base-r-aem: Remove unused FVP_BASE_R_ARM_EULA_ACCEPT variable
Date: Wed, 15 Sep 2021 10:57:44 +0100
Message-Id: <20210915095744.65790-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The FVP_BASE_R_ARM_EULA_ACCEPT variable is set by kas and doesn't need
to be initialised in the bb recipe.

Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Idbaa8b9fb7753e3c1f77e88710109324322aaf05
---
 meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-r-aem.bb
index 53b849a..50e6402 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
 # yourself from the homepage and set FVP_BASE_R_AEM_TARBALL_URI appropri=
ately
 # (for example, file:///home/user/FVP_Base_AEMv8R_11.15_14.tgz).
 FVP_BASE_R_AEM_TARBALL_URI ?=3D ""
-FVP_BASE_R_ARM_EULA_ACCEPT ?=3D "False"
 PV =3D "11.15_14"
=20
 SRC_URI =3D "${FVP_BASE_R_AEM_TARBALL_URI};subdir=3D${BP}"
--=20
2.25.1

