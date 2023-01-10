Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF88BC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 10:46:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.101087.1673347568241687238
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 02:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B38FA4B3;
	Tue, 10 Jan 2023 02:46:49 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 299D23F587;
	Tue, 10 Jan 2023 02:46:07 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm/classes: Ensure patch files are sorted in apply_local_src_patches
Date: Tue, 10 Jan 2023 10:45:36 +0000
Message-Id: <20230110104536.686539-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 10:46:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4248

From: Peter Hoyes <Peter.Hoyes@arm.com>

apply_local_src_patches.bbclass was added in a previous patch to handle
the application of patch files located inside the fetched source code.

find is used to collect the patch files which does not guarantee the
order of its output. Pipe the output of find into sort to ensure patch
files are applied in the correct order.

Issue-Id: SCM-5864
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I1082fb7a726a7745289a5aa8bb6447bef57a94b0
---
 meta-arm/classes/apply_local_src_patches.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/apply_local_src_patches.bbclass b/meta-arm/=
classes/apply_local_src_patches.bbclass
index daa85f4c..e1939353 100644
--- a/meta-arm/classes/apply_local_src_patches.bbclass
+++ b/meta-arm/classes/apply_local_src_patches.bbclass
@@ -32,7 +32,7 @@ apply_local_src_patches() {
     export QUILT_PATCHES=3D./patches-extra
     mkdir -p patches-extra
=20
-    for patch in $(find $input_dir -type f -name *.patch -or -name *.dif=
f)
+    for patch in $(find $input_dir -type f -name *.patch -or -name *.dif=
f | sort)
     do
         patch_basename=3D`basename $patch`
         if ! quilt applied $patch_basename >/dev/null ; then
--=20
2.34.1


