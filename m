Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2FFC369CA
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:12:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11538.1744981922695879225
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B150150C
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:11:59 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CD5A3F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/python3-pydevicetree: update to 0.0.13
Date: Fri, 18 Apr 2025 09:12:01 -0400
Message-Id: <20250418131201.95204-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418131201.95204-1-jon.mason@arm.com>
References: <20250418131201.95204-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6471

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-pydevicetree_0.0.12.bb =3D> python3-pydevicetree_0.0.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-devtools/python/{python3-pydevicetree_0.0.12.bb =
=3D> python3-pydevicetree_0.0.13.bb} (55%)

diff --git a/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.12=
.bb b/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.13.bb
similarity index 55%
rename from meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.12.=
bb
rename to meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.13.bb
index fdd7715df629..7a1ba7173002 100644
--- a/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.12.bb
+++ b/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.13.bb
@@ -1,10 +1,10 @@
 SUMMARY =3D "Python 3 library for parsing, querying, and modifying Devic=
etree Source v1 files"
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D23=
f9ad5cad3d8cc0336e2a5d8a87e1fa"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D28=
62203650706153a696787039ebd509"
 HOMEPAGE =3D "https://github.com/sifive/pydevicetree"
=20
 inherit pypi setuptools3
=20
-SRC_URI[sha256sum] =3D "1ca19ec38bec0095a0a8dc4753a578e8c6e9a70873112547=
d30c92b32411f667"
+SRC_URI[sha256sum] =3D "5700c05df89bad8fd729c11aa6f764a3323bcb3796f13b32=
481ae34445cfc1b7"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.5 (Apple Git-154)


