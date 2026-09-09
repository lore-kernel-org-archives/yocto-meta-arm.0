Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B671C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 18:03:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18924.1788977028109686937
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 11:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sv4qlRK7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CED191691
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Sep 2026 11:03:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F6303F528
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Sep 2026 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788977027; bh=6G4Iz9fzrE0yj+juQJ31P2OGj5VMI5zu+tcN2mHbOlM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sv4qlRK7mWnk9jStVB8noP0NjlAfbkUMsp6fDH7LVRIuf5StWMkQMV6Tg/sqEeBjK
	 B+IAZ9xjYsZiBr0YIYIfh8C719HXUBNszO1jq/Qokwf81V+oD+5/mC86MQYxoXReux
	 J5BwlKIYk/jZV2mMgjN3Q47EH7lceKMVfzrhA/TI=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/trusted-firmware-a: enable OpenSSL stub engine API
Date: Wed,  9 Sep 2026 19:03:40 +0100
Message-ID: <20260909180341.3858400-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909180341.3858400-1-ross.burton@arm.com>
References: <20260909180341.3858400-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Sep 2026 18:03:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7163

The cert_create tool uses the OpenSSL engine API, which has been removed
from OpenSSL 4.  Enable the engine stubs to fix the build until this is
resolved upstream.

Also shoe-horn BUILD_CFLAGS into cert_create/Makefile, so the define is
passed to the build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 1e06559ce28..9a2b741f335 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -93,6 +93,10 @@ def remove_options_tail (in_string):
     from itertools import takewhile
     return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string=
.split(' ')))
=20
+# tools/cert_create/src/key.c uses the OpenSSL engine API, but this has =
been removed
+# from OpenSSL 4.  Enable the compatibility stub APIs until upstream is =
fixed.
+BUILD_CFLAGS +=3D "-DOPENSSL_ENGINE_STUBS"
+
 EXTRA_OEMAKE +=3D "${@'' if d.getVar('TFA_LTO') else "'LD=3D" + remove_o=
ptions_tail(d.getVar('LD')) + "'"}"
=20
 EXTRA_OEMAKE +=3D "CC=3D'${@remove_options_tail(d.getVar('CC'))}'"
@@ -158,6 +162,7 @@ do_compile() {
     sed -i '/^LDOPTS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
     sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
     sed -i '/^LIB/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/cert_create/Make=
file
+    sed -i '/^INC_DIR / s,$, \$\{BUILD_CFLAGS},' ${S}/tools/cert_create/=
Makefile
=20
     # Currently there are races if you build all the targets at once in =
parallel
     for T in ${TFA_BUILD_TARGET}; do
--=20
2.43.0


