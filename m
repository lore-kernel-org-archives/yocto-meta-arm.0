Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AA5C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:56:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.30751.1632747367571683995
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 05:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13D8AD6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19813F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm/fvpboot: clean up fvpboot_vars
Date: Mon, 27 Sep 2021 13:55:58 +0100
Message-Id: <20210927125602.3400822-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927125602.3400822-1-ross.burton@arm.com>
References: <20210927125602.3400822-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 12:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2231

Change-Id: I43a04cd1b977fbf7d0050b2ab9e7509c0439dca5
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/classes/fvpboot.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index 18a9d686..de66d7ce 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -74,7 +74,8 @@ python do_write_fvpboot_conf() {
 }
=20
 def fvpboot_vars(d):
-    build_vars =3D ['DEPLOY_DIR_IMAGE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
-                  'COMPONENTS_DIR', 'BUILD_ARCH']
-    return build_vars + [k for k in d.keys() if k.startswith('FVP_')]
-do_write_fvpboot_conf[vardeps] +=3D "${@' '.join(fvpboot_vars(d))}"
+    vars =3D ['DEPLOY_DIR_IMAGE', 'IMAGE_NAME', 'IMAGE_LINK_NAME', 'COMP=
ONENTS_DIR', 'BUILD_ARCH']
+    vars.extend((k for k in d.keys() if k.startswith('FVP_')))
+    return " ".join(vars)
+
+do_write_fvpboot_conf[vardeps] +=3D "${@fvpboot_vars(d)}"
--=20
2.25.1


