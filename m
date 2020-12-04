Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15666.1607095757764694665
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89D43142F
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 363D63F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:11 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 02/17] external-arm-toolchain: Remove glibc locale dependency
Date: Fri,  4 Dec 2020 15:28:50 +0000
Message-Id: <20201204152905.1160276-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sumit Garg <sumit.garg@linaro.org>

Currently external Arm toolchain recipe doesn't provide packages
corresponding to OE glibc locale recipe. So explicitly remove correspondi=
ng
libc dependencies until we sort out glibc locale packaging rather than
blocking OE SDK generation which is still useful without glibc locale
packaging.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.i=
nc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 9171380..eee1a51 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -58,6 +58,7 @@ DISTRO_FEATURES_LIBC =3D "ipv4 ipv6 libc-backtrace libc=
-big-macros libc-bsd libc-c
 ENABLE_BINARY_LOCALE_GENERATION =3D "0"
 GLIBC_INTERNAL_USE_BINARY_LOCALE =3D "precompiled"
 LIBCOVERRIDE =3D ":libc-glibc"
+LIBC_DEPENDENCIES_remove =3D "glibc-gconv-cp1252 glibc-gconv-ibm850 glib=
c-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
=20
 ERROR_QA[type] ?=3D "list"
 python toolchain_metadata_setup () {
--=20
2.25.1

