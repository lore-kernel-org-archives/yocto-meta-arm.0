Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.15607.1607095758947983822
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15CD2152F
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B68063F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:16 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 11/17] arm-toolchain/arm-binary-toolchain: more QA skipping
Date: Fri,  4 Dec 2020 15:28:59 +0000
Message-Id: <20201204152905.1160276-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When building nativesdk or target forms of these recipes more QA tests
are executed, which produce more warnings. As these recipes are quite
special, skip more tests:

- arch, as we ship ilp32 binaries in aarch64 packages
- dev-so, as the entire toolchain is put into a single package

Change-Id: Ib72b224749642c912278f0d5601fe04b30afc25f
Signed-off-by: Ross Burton <ross.burton@arm.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/arm-binary-toolchain.inc
index d099481..2fbabfb 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
@@ -13,7 +13,7 @@ do_install() {
     done
 }
=20
-INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps"
+INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps arch=
 dev-so"
=20
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_STRIP =3D "1"
--=20
2.25.1

