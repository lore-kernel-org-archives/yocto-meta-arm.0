Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15583.1607095762463487261
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BE61143B
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9B13F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:11 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 03/17] external-arm-toolchain: Refine dev libraries/headers packaging
Date: Fri,  4 Dec 2020 15:28:51 +0000
Message-Id: <20201204152905.1160276-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sumit Garg <sumit.garg@linaro.org>

OE core by default package all libraies/headers installed as
"${libdir}/lib*.so", "${libdir}/*.la" and {includedir} as part of
FILES_${PN}-dev" but in case of external Arm toolchain recipe, multiple
packages are provided which needs to include specific libraries and
headers. And "${PN}-dev" is only meant to pick up remaining dev libraries
and headers that aren't picked up by other packages.

So in order to achieve above objective, re-order PACKAGES list to shift
${PN}-dev towards the end. And since some static libraries needs to be
packaged in ${PN}-dev, so we need to keep ${PN}-staticdev later in order.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain.bb                       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index 8cfc208..73a2cf6 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -305,6 +305,19 @@ PACKAGES =3D+ "\
 	linux-libc-headers-dev \
 "
=20
+# Re-order PACKAGES list in order to shift ${PN}-dev towards the end as
+# it is meant to pick up remaining dev libraries and headers that aren't
+# picked up by other packages. And since some static libraries needs to
+# be packaged in ${PN}-dev, so we need to keep ${PN}-staticdev later in
+# order.
+
+PACKAGES :=3D "${@oe.utils.str_filter_out('${PN}-dev', '${PACKAGES}', d)=
}"
+PACKAGES :=3D "${@oe.utils.str_filter_out('${PN}-staticdev', '${PACKAGES=
}', d)}"
+PACKAGES +=3D "\
+	${PN}-dev \
+	${PN}-staticdev \
+"
+
 INSANE_SKIP_${PN}-dbg =3D "staticdev"
 INSANE_SKIP_${PN}-utils +=3D "ldflags"
 INSANE_SKIP_libstdc++ +=3D "ldflags"
--=20
2.25.1

