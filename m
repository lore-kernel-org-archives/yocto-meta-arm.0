Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D224C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 18:21:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3367.1710354074995671158
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 11:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBFAB1007
	for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 11:21:50 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1D1B3F762
	for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 11:21:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] README: Add information about release process and mailing list
Date: Wed, 13 Mar 2024 14:21:11 -0400
Message-Id: <20240313182112.17829-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 18:21:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5432

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 README.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/README.md b/README.md
index 82c326de7ebf..e77e5acd9d10 100644
--- a/README.md
+++ b/README.md
@@ -29,6 +29,13 @@ Other Directories
=20
   This directory contains scripts used in running the CI tests
=20
+Mailing List
+------------
+To interact with the meta-arm developer community, please email the meta=
-arm mailing list at meta-arm@lists.yoctoproject.org
+Currently, it is configured to only allow emails to members from those s=
ubscribed.
+To subscribe to the meta-arm mailing list, please go to
+https://lists.yoctoproject.org/g/meta-arm
+
 Contributing
 ------------
 Currently, we only accept patches from the meta-arm mailing list.  For g=
eneral
@@ -49,6 +56,13 @@ The component being changed in the shortlog should be =
prefixed with the layer na
=20
   arm-toolchain/gcc: enable foobar v2
=20
+Releases and Release Schedule
+--------------
+We follow the Yocto Project release methodology, schedule, and stable/LT=
S support timelines.  For more information on these, please reference:
+https://docs.yoctoproject.org/ref-manual/release-process.html
+https://wiki.yoctoproject.org/wiki/Releases
+https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS
+
 Reporting bugs
 --------------
 E-mail meta-arm@lists.yoctoproject.org with the error encountered and th=
e steps
--=20
2.39.3 (Apple Git-146)


