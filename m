Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4947.1614856582196811637
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 03:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBAAC31B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Mar 2021 03:16:20 -0800 (PST)
Received: from e125927.arm.com (unknown [10.57.18.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C6CA3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Mar 2021 03:16:20 -0800 (PST)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-autonomy: Add meta-networking dependency to autonomy layer config
Date: Thu,  4 Mar 2021 11:17:32 +0000
Message-Id: <20210304111732.35026-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

meta-arm-autonomy requires the bridge-utils package, which is provided by=
 the
meta-openembedded/meta-networking layer. This patch adds the explicit
dependency.

Issue-Id: SCM-2166
Signed-off-by: Richard Neill <richard.neill@arm.com>
Change-Id: I3a43eb78fe1f40a9a2fb5116b5dbaf3ebfc9af7d
---
 meta-arm-autonomy/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/l=
ayer.conf
index dee0c01..38634f3 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -14,6 +14,7 @@ LAYERDEPENDS_meta-arm-autonomy =3D " \
    core \
    yocto \
    openembedded-layer \
+   networking-layer \
    virtualization-layer \
 "
 LAYERSERIES_COMPAT_meta-arm-autonomy =3D "gatesgarth"
--=20
2.25.1

