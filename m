Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1F1C4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 15:27:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10394.1698852470516798127
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 08:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9544D2F4;
	Wed,  1 Nov 2023 08:28:31 -0700 (PDT)
Received: from PW05BKJD.arm.com (PW05BKJD.arm.com [10.1.25.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2B7B3F64C;
	Wed,  1 Nov 2023 08:27:48 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 0/1] corstone1000: Update the user guide
Date: Wed,  1 Nov 2023 15:27:31 +0000
Message-Id: <20231101152732.1060-1-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Nov 2023 15:27:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5192

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

Update capsule document procedure and ACS image in user guide.

Ali Can Ozaslan (1):
  arm-bsp/documentation: corstone1000: Update the user guide

 .../documentation/corstone1000/user-guide.rst | 96 ++++++++++---------
 1 file changed, 52 insertions(+), 44 deletions(-)

--=20
2.34.1


