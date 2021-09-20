Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.781.1632161191660404635
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40A796D
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF7733F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:30 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 09/12] arm/fvp: add corstone700 FVP
Date: Mon, 20 Sep 2021 19:06:19 +0100
Message-Id: <20210920180622.3614621-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ia3a80cf34aeb2e4473bc6b6317852e152a5cbcff
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone700.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-corstone700.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone700.bb b/meta-arm/=
recipes-devtools/fvp/fvp-corstone700.bb
new file mode 100644
index 00000000..bda96a6b
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone700.bb
@@ -0,0 +1,9 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "Corstone-700"
+MODEL_CODE =3D "FVP_Corstone_700"
+PV =3D "11.10.47"
+
+# Temporary SRC_URI as the URL structure is unconventional
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/Corstone-700-updated-11-10-47/${MODEL_CODE}=
_${PV_URL}.tgz;subdir=3D${BP}"
+SRC_URI[sha256sum] =3D "255207771864edeca2610958811d30e458c03a2db0195035=
5a455513bad782ec"
--=20
2.25.1

