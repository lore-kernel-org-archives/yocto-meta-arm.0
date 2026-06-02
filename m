Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E954CD6E64
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:58:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24539.1780405093052442347
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 05:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=L6mBPnud;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 592492364
	for <meta-arm@lists.yoctoproject.org>; Tue,  2 Jun 2026 05:58:07 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A25D3F93E
	for <meta-arm@lists.yoctoproject.org>; Tue,  2 Jun 2026 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780405092; bh=i4u9z82CPkRq2iiuduqF5HwVFNgewjcRKzWwaBeRA7s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L6mBPnud81jCtcau9CZ/E01B+9opA+UouCiZbIqC8W+W6l/NxwUA7Hg8xmf50KGY5
	 Lk4hNI/MRBnBqgPrUVsmLaBmzGCYG9nXQmzh41Pn1ctpEETn6ZNJDnciJZhSm9TVvy
	 mYlb3ZNdzzswp11Pc2FmA8hXMd45cEHTVDKSspIs=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/ts-sp-common: Workaround unused-but-set-variable errors
Date: Tue,  2 Jun 2026 08:58:11 -0400
Message-ID: <20260602125811.54843-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260602125811.54843-1-jon.mason@arm.com>
References: <20260602125811.54843-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2026 12:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7068

With the new GCC, we're seeing the following error:
| In file included from /builder/meta-arm/build/tmp/work/armv8-5a-poky-li=
nux/ts-sp-smm-gateway/git/sources/ts/components/common/dlmalloc/malloc_wr=
apper.c:62:
| /builder/meta-arm/build/tmp/work/armv8-5a-poky-linux/ts-sp-smm-gateway/=
git/sources/ts/components/common/dlmalloc/malloc.c: In function 'add_segm=
ent':
| /builder/meta-arm/build/tmp/work/armv8-5a-poky-linux/ts-sp-smm-gateway/=
git/sources/ts/components/common/dlmalloc/malloc.c:4002:7: error: variabl=
e 'nfences' set but not used [-Werror=3Dunused-but-set-variable=3D]
|  4002 |   int nfences =3D 0;
|       |       ^~~~~~~

To workaround this issue, add "-Wno-error=3Dunused-but-set-variable" to T=
ARGET_CFLAGS

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/trusted-services/ts-sp-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc =
b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index eb89127b766c..114e5700a16e 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -33,6 +33,7 @@ INSANE_SKIP:${PN}-dev +=3D "ldflags"
 TOOLCHAIN =3D "gcc"
=20
 # FORTIFY_SOURCE is a glibc feature. Disable it for all SPs as these do =
not use glibc.
+TARGET_CFLAGS +=3D "-Wno-error=3Dunused-but-set-variable"
 TARGET_CFLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
 OECMAKE_C_FLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
 OECMAKE_CXX_FLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
--=20
2.50.1 (Apple Git-155)


