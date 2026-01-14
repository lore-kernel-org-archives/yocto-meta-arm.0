Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4928ED31A32
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:25:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6620.1768382722775139252
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 01:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6F6B497;
	Wed, 14 Jan 2026 01:25:15 -0800 (PST)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.25.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 975B93F694;
	Wed, 14 Jan 2026 01:25:21 -0800 (PST)
From: frazer.carsley@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/3] arm/images: ensured consistent firmware deployment
Date: Wed, 14 Jan 2026 09:24:50 +0000
Message-ID: <20260114092452.286544-2-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114092452.286544-1-frazer.carsley@arm.com>
References: <20260114092452.286544-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 09:25:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6841

From: Frazer Carsley <frazer.carsley@arm.com>

For builds using multiconfig, all of the firmware binaries listed were
being placed in the ${DEPLOYDIR} directly without preserving their
directory hierarchy. This meant that paths to firmware binaries relative
to the ${DEPLOYDIR} differed between builds depending on whether
multiconfig was enabled or not.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 meta-arm/recipes-bsp/images/firmware-deploy-image.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/images/firmware-deploy-image.bb b/meta-=
arm/recipes-bsp/images/firmware-deploy-image.bb
index 2f347f0b..85bdc952 100644
--- a/meta-arm/recipes-bsp/images/firmware-deploy-image.bb
+++ b/meta-arm/recipes-bsp/images/firmware-deploy-image.bb
@@ -18,11 +18,14 @@ do_deploy() {
     firmware_loc=3D$(echo "${TMPDIR}" | sed "s/${TCLIBC}/musl/")
     firmware_loc=3D"${firmware_loc}_${MACHINE}/deploy/images/${MACHINE}"
     for firmware in ${FIRMWARE_BINARIES}; do
-        echo "cp -av ${firmware_loc}/${firmware} ${DEPLOYDIR}/"
-        cp -av "${firmware_loc}/${firmware}" ${DEPLOYDIR}/
+        # Preserve the directory structure when copying
+        subdir=3D"$(dirname -- "${firmware}")"
+        mkdir -p "${DEPLOYDIR}"/"${subdir}"
+        echo "cp -av ${firmware_loc}/${firmware} ${DEPLOYDIR}/${subdir}"
+        cp -av "${firmware_loc}/${firmware}" ${DEPLOYDIR}/"${subdir}"
         if [ -L "${firmware_loc}/${firmware}" ]; then
-            echo "cp -av ${firmware_loc}/$(readlink ${firmware_loc}/${fi=
rmware}) ${DEPLOYDIR}/"
-            cp -av "${firmware_loc}/$(readlink ${firmware_loc}/${firmwar=
e})" ${DEPLOYDIR}/
+            echo "cp -av ${firmware_loc}/$(readlink ${firmware_loc}/${fi=
rmware}) ${DEPLOYDIR}/${subdir}"
+            cp -av "${firmware_loc}/$(readlink ${firmware_loc}/${firmwar=
e})" ${DEPLOYDIR}/${subdir}
         fi
     done
 }

