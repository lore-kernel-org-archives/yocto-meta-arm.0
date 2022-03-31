Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD2BC433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:31:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.750.1648751482077540218
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2465139F
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6464C3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] runfvp: strip all suffixes from the image when
 calculating .fvpconf name
Date: Thu, 31 Mar 2022 19:31:13 +0100
Message-Id: <20220331183117.22389-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331183117.22389-1-ross.burton@arm.com>
References: <20220331183117.22389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3219

Until testimage tells the controller the basename of the image, make sure
to strip all suffixes from the image name to get the base name, not just
one.  Machines such as corstone500 have images called .wic.nopt, so just
stripping one isn't sufficient.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 7136a003..2913f782 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -16,7 +16,9 @@ class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
                  **kwargs):
         super().__init__(logger, target_ip, server_ip, timeout, user, po=
rt)
         image_dir =3D pathlib.Path(dir_image)
-        basename =3D pathlib.Path(rootfs).stem
+        # rootfs may have multiple extensions so we need to strip *all* =
suffixes
+        basename =3D pathlib.Path(rootfs)
+        basename =3D basename.name.replace("".join(basename.suffixes), "=
")
         self.fvpconf =3D image_dir / (basename + ".fvpconf")
=20
         if not self.fvpconf.exists():
--=20
2.25.1


