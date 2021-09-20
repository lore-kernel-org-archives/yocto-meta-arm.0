Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.773.1632161189694011319
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACF306D
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 577353F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:30 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 08/12] arm/fvp: add corstone500 FVP
Date: Mon, 20 Sep 2021 19:06:18 +0100
Message-Id: <20210920180622.3614621-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I70e745a2bb7328c8abcb950340d99e9fc39d754a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone500.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-corstone500.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone500.bb b/meta-arm/=
recipes-devtools/fvp/fvp-corstone500.bb
new file mode 100644
index 00000000..14704145
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone500.bb
@@ -0,0 +1,7 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "Corstone-500"
+MODEL_CODE =3D "FVP_Corstone_500"
+PV =3D "11.12.59"
+
+SRC_URI[sha256sum] =3D "26f0fbb52de2ccdb4c7b40b6f4ddb5eabdcb8173775fdd11=
c9a12173326f8614"
--=20
2.25.1

