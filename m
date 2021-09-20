Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.787.1632161189314631494
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7926F11FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 241A83F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 04/12] arm/fvp-common: store the mangled PV as PV_URL
Date: Mon, 20 Sep 2021 19:06:14 +0100
Message-Id: <20210920180622.3614621-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FVP versions in the download URLs are expressed as 11.12_13, but ideally
we'll use a rationalised 11.12.13 form as it's more consistant.

Add a function to transform from a all-dots form to use underscore for
the final portion, and expose this version as PV_URL.

Change-Id: I632b33913baba0f0847440595ef0699d0a769166
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-common.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 82b82675..83e03131 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -9,6 +9,12 @@ LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL=
-3.0-with-GCC-exception &
 COMPATIBLE_HOST =3D '(x86_64|i.86).*-linux'
 FVP_ARCH =3D "Linux64_GCC-6.4"
=20
+def get_real_pv(d):
+    # FVP versions are like 11.12_43
+    pv =3D d.getVar("PV")
+    return "%s.%s_%s" % tuple(pv.split("."))
+PV_URL =3D "${@get_real_pv(d)}"
+
 # The directory the FVP is installed into
 FVPDIR =3D "${libdir}/fvp/${BPN}"
=20
--=20
2.25.1

