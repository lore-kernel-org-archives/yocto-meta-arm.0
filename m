Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75228E92FD2
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:09:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20663.1697040547441509904
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 09:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1DF6150C
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Oct 2023 09:09:47 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EAACB3F7A6
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Oct 2023 09:09:06 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: add sbsa-acs to recipe report
Date: Wed, 11 Oct 2023 08:02:03 -0500
Message-Id: <20231011130203.3871606-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231011130203.3871606-1-jon.mason@arm.com>
References: <20231011130203.3871606-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Oct 2023 16:09:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5107

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/machine-summary.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 3038237c..ad8243fc 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -139,6 +139,7 @@ def harvest_data(machines, recipes):
=20
 # TODO can this be inferred from the list of recipes in the layer
 recipes =3D ("virtual/kernel",
+           "sbsa-acs",
            "scp-firmware",
            "trusted-firmware-a",
            "trusted-firmware-m",
--=20
2.30.2


