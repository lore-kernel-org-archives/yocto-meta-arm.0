Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF59CD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 09:48:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13658.1712828899820316447
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 02:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 637A1113E;
	Thu, 11 Apr 2024 02:48:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64E9F3F6C4;
	Thu, 11 Apr 2024 02:48:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-systemready: Change get_json_result_dir helper
Date: Thu, 11 Apr 2024 09:48:09 +0000
Message-Id: <20240411094809.1685341-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 09:48:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5519

From: Debbie Martin <Debbie.Martin@arm.com>

The get_testimage_json_result_dir helper in OE core was deleted in
commit 01b1a6a5a4e7cede4d23a981b5144ae9c8306274 in preference for a
common utility. Change the reference within the Arm SystemReady ACS
log handler utlity.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 meta-arm-systemready/classes/arm-systemready-acs.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-systemready/classes/arm-systemready-acs.bbclass b/m=
eta-arm-systemready/classes/arm-systemready-acs.bbclass
index 28e800c8..9dc3635d 100644
--- a/meta-arm-systemready/classes/arm-systemready-acs.bbclass
+++ b/meta-arm-systemready/classes/arm-systemready-acs.bbclass
@@ -86,7 +86,7 @@ do_testimage[depends] +=3D "edk2-test-parser-native:do_=
populate_sysroot \
 # Process the logs
 python acs_logs_handle() {
     import logging
-    from oeqa.utils import make_logger_bitbake_compatible
+    from oeqa.utils import make_logger_bitbake_compatible, get_json_resu=
lt_dir
     import shutil
=20
     deploy_dir_image =3D d.getVar('DEPLOY_DIR_IMAGE')
@@ -117,7 +117,7 @@ python acs_logs_handle() {
     os.symlink(os.path.basename(logdir), loglink)
=20
     # Create a top-level symlink to the acs_results directory
-    top_logdir =3D os.path.join(get_testimage_json_result_dir(d), d.getV=
ar("PN"))
+    top_logdir =3D os.path.join(get_json_result_dir(d), d.getVar("PN"))
     log_name =3D d.getVar('ACS_LOG_NAME')
     top_link =3D os.path.join(top_logdir, log_name)
     log_target =3D os.path.relpath(logdir, top_logdir)
--=20
2.34.1


