Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3796.1591230246290306710
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Jun 2020 17:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A20C440BCC;
	Thu,  4 Jun 2020 00:24:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4cmMyLYtX47; Thu,  4 Jun 2020 00:24:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF6F540B53;
	Thu,  4 Jun 2020 00:24:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A36491731FF;
	Wed,  3 Jun 2020 20:24:02 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] external-arm-toolchain: un-break target compilation
Date: Wed,  3 Jun 2020 20:24:02 -0400
Message-Id: <1591230242-20553-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Compiling on the target using runtime libs from external-arm-toolchain
requires libgcc.a, as libgcc_s.so explains:

/* GNU ld script
   Use the shared library, but some functions are only in
   the static library.  */
GROUP ( libgcc_s.so.1 -lgcc )

Otherwise it results in errors like:
| /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
| /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
| collect2: error: ld returned 1 exit status

This already has been fixed before in this commit:
https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce

But then it got broken/undone here w/o due review:
https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=b43d5f0ce431ba1e242504641266a63293ded5db

Even though it's a static library, we want it to be in libgcc-dev as it's
not optional, but rather required for development.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 04d8923..8cfc208 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -117,7 +117,7 @@ do_install() {
 	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
 
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
@@ -310,6 +310,7 @@ INSANE_SKIP_${PN}-utils += "ldflags"
 INSANE_SKIP_libstdc++ += "ldflags"
 INSANE_SKIP_libgfortran += "ldflags"
 INSANE_SKIP_libgcc += "ldflags dev-deps"
+INSANE_SKIP_libgcc-dev += "staticdev"
 INSANE_SKIP_libgfortran += "ldflags dev-deps"
 INSANE_SKIP_libstdc++ += "ldflags dev-deps"
 INSANE_SKIP_libatomic += "ldflags"
-- 
2.7.4

