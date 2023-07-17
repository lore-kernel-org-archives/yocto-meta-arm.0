Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD33DC001E0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 19:32:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4086.1689622334716925400
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 12:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61127143D;
	Mon, 17 Jul 2023 12:32:58 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C10763F67D;
	Mon, 17 Jul 2023 12:32:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ziad Elhanafy <ziad.elhanafy@arm.com>
Subject: [PATCH 7/9] arm/lib: Modify fvp.py to neglect fstype
Date: Mon, 17 Jul 2023 14:32:05 -0500
Message-Id: <20230717193207.3562364-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230717193207.3562364-1-jon.mason@arm.com>
References: <20230717193207.3562364-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 19:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4891

From: Ziad Elhanafy <ziad.elhanafy@arm.com>

Signed-off-by: Ziad Elhanafy <ziad.elhanafy@arm.com>
---
 meta-arm/lib/oeqa/controllers/fvp.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index 38484072..7e95ddf6 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -14,16 +14,20 @@ class OEFVPSSHTarget(OESSHTarget):
     def __init__(self, logger, target_ip, server_ip, timeout=3D300, user=
=3D'root',
                  port=3DNone, dir_image=3DNone, rootfs=3DNone, bootlog=3D=
None, **kwargs):
         super().__init__(logger, target_ip, server_ip, timeout, user, po=
rt)
-        image_dir =3D pathlib.Path(dir_image)
-        # rootfs may have multiple extensions so we need to strip *all* =
suffixes
+        image_dir =3D pathlib.Path(dir_image)   =20
         basename =3D pathlib.Path(rootfs)
-        basename =3D basename.name.replace("".join(basename.suffixes), "=
")
-        self.fvpconf =3D image_dir / (basename + ".fvpconf")
+        basename =3D basename.name.replace("".join(basename.suffixes), "=
")      =20
+        # All .fvpconf configuration files
+        configs =3D image_dir.glob(basename + "*.fvpconf")
+        # Just the symbolic links
+        configs =3D [p for p in configs if p.is_file() and p.is_symlink(=
)]
+        if not configs:
+            raise FileNotFoundError(f"Cannot find any .fvpconf in {image=
_dir}")
+        # Sorted by modification time
+        configs =3D sorted(configs, key=3Dlambda p: p.stat().st_mtime)
+        self.fvpconf =3D configs[-1]
         self.bootlog =3D bootlog
=20
-        if not self.fvpconf.exists():
-            raise FileNotFoundError(f"Cannot find {self.fvpconf}")
-
     def _after_start(self):
         pass
=20
--=20
2.30.2


