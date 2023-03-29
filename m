Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E69C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:48:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1595.1680104931871641652
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 08:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBEA31FB;
	Wed, 29 Mar 2023 08:49:35 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98413F6C4;
	Wed, 29 Mar 2023 08:48:50 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm/trusted-services: Fix 'no such file' when building libts
Date: Wed, 29 Mar 2023 16:48:40 +0100
Message-Id: <20230329154840.1827565-3-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329154840.1827565-1-adam.johnston@arm.com>
References: <20230329154840.1827565-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 15:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4503

From: Adam Johnston <adam.johnston@arm.com>

The libts recipe assumes generated cmake file will be suffixed with
'-noconfig'. This is only true when building with the default type
i.e. "".

Check which target cmake file has been generated before trying to
patch it. This fixes 'no such file' error when building with an
explicit type (Debug, Release, etc).

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 meta-arm/recipes-security/trusted-services/libts_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/me=
ta-arm/recipes-security/trusted-services/libts_git.bb
index 598b281b..aafe8516 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -24,11 +24,14 @@ do_install:append () {
     fi
=20
     # Move the dynamic libraries into the standard place.
-    # Update a cmake file to use correct paths.
     install -d ${D}${libdir}
     mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}
=20
-    sed -i -e "s#/${TS_ENV}##g" ${D}${TS_INSTALL}/lib/cmake/libts/libtsT=
argets-noconfig.cmake
+    # Update generated cmake file to use correct paths.
+    target_cmake=3D$(find ${D}${TS_INSTALL}/lib/cmake/libts -type f -ina=
me "libtsTargets-*.cmake")
+    if [ ! -z "$target_cmake" ]; then
+        sed -i -e "s#/${TS_ENV}##g" $target_cmake
+    fi
 }
=20
 inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-=
mdev', '', 'useradd', d)}
--=20
2.38.1


