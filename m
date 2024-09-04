Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF50ACD3431
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 08:40:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45254.1725439237215576386
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Sep 2024 01:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF9C8DA7;
	Wed,  4 Sep 2024 01:41:02 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.75.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DADC33F66E;
	Wed,  4 Sep 2024 01:40:35 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm-bsp/documentation: corstone1000: Mention PMOD module as prerequisite
Date: Wed,  4 Sep 2024 09:40:31 +0100
Message-Id: <20240904084031.2032187-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 08:40:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6056

Add a warning in the Corstone-1000 documentation to indicate to the
end user that a 32 MB QSPI flash PMOD module is required to run
the Corstone-1000 software stack on MPS3-FPGA with the AN550 Application
note programmed.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/user-guide.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 359caf2d..58231731 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -36,10 +36,14 @@ Please follow the steps described in the Yocto mega m=
anual:
=20
 Targets
 -------
+The Corstone-1000 software stack can be run on:
=20
 - `Arm Corstone-1000 Ecosystem FVP (Fixed Virtual Platform) <https://dev=
eloper.arm.com/downloads/-/arm-ecosystem-fvps>`__
 - `Arm Corstone-1000 for MPS3 <https://developer.arm.com/documentation/d=
ai0550/latest/>`__
=20
+.. warning::
+    Arm Corstone-1000 for MPS3 requires an additional 32 MB QSPI flash P=
MOD module. For more information see the `Application Note AN550 document=
 <https://developer.arm.com/documentation/dai0550/latest/>`__.
+
 Yocto stable branch
 -------------------
=20

