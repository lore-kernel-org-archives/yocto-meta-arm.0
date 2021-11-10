Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624B6C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 16:24:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.476.1636561459272073656
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 08:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12971435
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 08:24:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D0223F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 08:24:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/python3-cbor: remove, cbor2 is used now
Date: Wed, 10 Nov 2021 16:24:13 +0000
Message-Id: <20211110162414.3428096-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110162414.3428096-1-ross.burton@arm.com>
References: <20211110162414.3428096-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 16:24:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2359

This recipe was used by trusted-firmware-m and python3-imgtool, both of
which now use python3-cbor2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-cbor_1.0.0.bb                 | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/python/python3-cbor_1.0.0.b=
b

diff --git a/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb b/met=
a-arm/recipes-devtools/python/python3-cbor_1.0.0.bb
deleted file mode 100644
index 1df062bc..00000000
--- a/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION =3D "An implementation of RFC 7049 - Concise Binary Object R=
epresentation (CBOR)."
-HOMEPAGE =3D "https://github.com/brianolson/cbor_py"
-
-LICENSE =3D "Apache-2.0"
-# Use a line from setup.py until LICENSE is distributed
-# (https://github.com/brianolson/cbor_py/issues/20)
-LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D88;endline=3D88;md5=3D=
267392b618a88b03e5987f69d9b98699"
-
-SRC_URI[md5sum] =3D "22b03b59784fd78cb6c27aa498af0db6"
-SRC_URI[sha256sum] =3D "13225a262ddf5615cbd9fd55a76a0d53069d18b07d2e9f19=
c39e6acb8609bbb6"
-
-PYPI_PACKAGE =3D "cbor"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native"
--=20
2.25.1


