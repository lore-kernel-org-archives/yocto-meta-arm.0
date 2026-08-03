Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B874C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 10:14:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40116.1785752071683955145
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Aug 2026 03:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=BYewR0SE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BCF5143D;
	Mon,  3 Aug 2026 03:14:27 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A325E3F632;
	Mon,  3 Aug 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752071; bh=LTYi8oL1AM75LWaEWeegOW1bmEbNHmZyyUwMdxho/wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BYewR0SEkKGdimycxS2YJU5+1UVWAuQpISbQsx2hUpMHY68wjHA9lVOMU+i61ZzYB
	 TwRtFt1Lie/Da+vS6jUyqe6OYVi4Q1bRfuI54mUDycp1rcMEPwPfqd3UxwIiDngMw8
	 snCtq4zPqANoYsvgfUW3Yyp+N4UPjqs+HCEIgrWM=
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 2/2] arm-bsp/docs:corstone1000: Clarify secure debug setup
Date: Mon,  3 Aug 2026 11:14:01 +0100
Message-ID: <20260803101401.3496378-3-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101401.3496378-1-alex.chapman@arm.com>
References: <20260803101401.3496378-1-alex.chapman@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Aug 2026 10:14:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7136

Replace the incomplete Arm Development Studio steps with the configuratio=
n database and hardware connection flow.

Initialize the required submodules and document that the Secure Debug Man=
ager library must be built before importing the configuration.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 36c6ae35..640e0c5f 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -2154,8 +2154,10 @@ and `Arm Development Studio <arm-ds-website_>`__ v=
ersions 2022.2, 2022.c, or 202
=20
         cd ${WORKSPACE}/secure-debug-manager
         git checkout b30d6496ca749123e86b39b161b9f70ef76106d6
+        git submodule update --init
=20
 #. Follow the instructions in the `Secure Debug Manager (PSA-ADAC / SDC-=
600)'s README <secure-debug-manager-repo-readme_>`__ for the development =
machine setup.
+   This setup must include building the Secure Debug Manager because the=
 built library completes the Arm Development Studio configuration.
=20
 #. Rebuild the software stack with Secure Debug.
=20
@@ -2177,9 +2179,34 @@ and `Arm Development Studio <arm-ds-website_>`__ v=
ersions 2022.2, 2022.c, or 202
=20
 #. Connect the debug probe to the MPS3 using the 20-pin 1.27mm connector=
 with the ``CS_20W_1.27MM silkscreen`` label.
=20
-#. Create a debug configuration in Arm Development Studio as described i=
n the `Secure Debug Manager (PSA-ADAC / SDC-600)'s README <secure-debug-m=
anager-armds-integration_>`__.
-
-#. Connect the debuger to the target using the debug configuration.
+#. Open a new Arm Development Studio IDE window and add the Secure Debug=
 Manager configuration database.
+
+   #. Select ``Window`` > ``Preferences``.
+   #. Expand ``Arm DS`` and select ``Configuration Database``.
+   #. Select ``Add``.
+   #. Enter a descriptive name, such as ``Corstone-1000 Secure Debug``.
+      The name does not affect the connection.
+   #. Set ``Location`` to ``${WORKSPACE}/secure-debug-manager/arm_ds/DB`=
`.
+   #. Select ``OK`` to close the ``Add configuration database location``=
 dialog.
+   #. Select ``Rebuild database``.
+   #. Select ``Apply and Close``.
+
+#. Create the Arm Development Studio hardware connection.
+
+   #. Select ``Create a debug connection...``.
+   #. Select ``Hardware Connection``, then select ``Next``.
+   #. Enter a descriptive debug connection name, then select ``Next``.
+      The name does not affect the connection.
+   #. In ``Target Selection``, select ``MPS3_Corstone-1000_ADAC``.
+   #. Select ``Finish``.
+
+#. Configure and start the debug connection.
+
+   #. Select ``Arm`` > ``MPS3_Corstone-1000_ADAC`` > ``Bare Metal Debug`=
` > ``Cortex-A35``.
+   #. For ``Target Connection``, select ``ULINKpro``.
+   #. Select ``Browse...``.
+   #. In the ``Connection Browser``, select the name of the connected UL=
INKpro probe, then select ``Select``.
+   #. Select ``Debug``.
=20
 #. Provide the paths to the private key and trust chain certificate when=
 asked by Arm Development Studio Console.
=20

