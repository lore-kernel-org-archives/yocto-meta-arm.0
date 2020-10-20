Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9366.1603209699328279382
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 09:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D360C1FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:01:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 764B23F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:01:38 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/layer.conf: add meta-python for musca
Date: Tue, 20 Oct 2020 17:01:35 +0100
Message-Id: <20201020160136.473402-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I46568f3144519bc25a65bce3d29d0ae659335f55
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/layer.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 816ff9d..eedb7e0 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,5 +9,9 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp =3D "6"
=20
-LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm meta-kernel"
 LAYERSERIES_COMPAT_meta-arm-bsp =3D "dunfell gatesgarth"
+
+LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm meta-kernel"
+# This won't be used by layerindex-fetch, but works everywhere else
+LAYERDEPENDS_meta-arm-bsp_append_musca-b1 =3D " meta-python"
+LAYERDEPENDS_meta-arm-bsp_append_musca-s1 =3D " meta-python"
--=20
2.25.1

