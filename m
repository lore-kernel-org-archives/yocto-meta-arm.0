Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.31351.1631547315296687486
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 08:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E050101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 08:35:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A943F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 08:35:13 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][gatesgarth 2/2] external-arm-toolchain: Misc. fixup for GCC 10.2 support
Date: Mon, 13 Sep 2021 16:35:10 +0100
Message-Id: <20210913153510.3788330-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913153510.3788330-1-ross.burton@arm.com>
References: <20210913153510.3788330-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sumit Garg <sumit.garg@linaro.org>

Arm GCC 10.2 prebuilt toolchain comes with ldd and tzselect scripts
which uses "/usr/bin/bash", so replace this with "/bin/sh" as the
default shell.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index b44fd2f4..c506c419 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -115,6 +115,8 @@ do_install() {
 	rm -rf ${D}${bindir}/gdbserver
 	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzsel=
ect
 	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
+	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
+	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/ldd
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
=20
--=20
2.25.1

