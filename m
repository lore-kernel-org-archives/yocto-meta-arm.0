Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03347CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 14:19:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13582.1712067537614184679
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 07:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 886371007;
	Tue,  2 Apr 2024 07:19:28 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.35.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6BC13F64C;
	Tue,  2 Apr 2024 07:18:55 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] arm-bsp/corstone1000: add documentation disclaimer
Date: Tue,  2 Apr 2024 15:18:46 +0100
Message-Id: <20240402141846.48855-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Apr 2024 14:19:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5505

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

add Security Vulnerability Disclaimer in Corstone-1000 documentation

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/index.rst       | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/index.rst b/meta-arm=
-bsp/documentation/corstone1000/index.rst
index 8626c42c..cbe78c5d 100644
--- a/meta-arm-bsp/documentation/corstone1000/index.rst
+++ b/meta-arm-bsp/documentation/corstone1000/index.rst
@@ -1,11 +1,21 @@
 ..
- # Copyright (c) 2022, Arm Limited.
+ # Copyright (c) 2022, 2024, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
-################
-ARM Corstone1000
-################
+#################
+Arm Corstone-1000
+#################
+
+*************************
+Disclaimer
+*************************
+
+Arm reference solutions are Arm public example software projects that tr=
ack and
+pull upstream components, incorporating their respective security fixes
+published over time. Arm partners are responsible for ensuring that the
+components they use contain all the required security fixes, if and when=
 they
+deploy a product derived from Arm reference solutions.
=20
 .. toctree::
    :maxdepth: 1
--=20
2.25.1


