Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.782.1632161192152961963
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B58113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 741603F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:31 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 10/12] arm/fvp: add Total Compute FVP
Date: Mon, 20 Sep 2021 19:06:20 +0100
Message-Id: <20210920180622.3614621-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Iaeff2027ac055519d30d160c97b905974b85567b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-tc0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-tc0.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-tc0.bb b/meta-arm/recipes-=
devtools/fvp/fvp-tc0.bb
new file mode 100644
index 00000000..bdcd5cab
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-tc0.bb
@@ -0,0 +1,10 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "TotalCompute"
+MODEL_CODE =3D "FVP_TC0"
+PV =3D "11.15.20"
+
+SRC_URI[sha256sum] =3D "792ddb425eba0714a1590aa8e404845b7654758c66374569=
3216ae1343ceef2d"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3Da=
50d186fffa51ed55599183aad911298 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
--=20
2.25.1

