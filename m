Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D93ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 15:03:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.207.1662476609398139671
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 08:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CDF71A2D;
	Tue,  6 Sep 2022 08:03:35 -0700 (PDT)
Received: from e127954.cambridge.arm.com (e127954.cambridge.arm.com
 [10.1.195.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 535D83F7B4;
	Tue,  6 Sep 2022 08:03:28 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 0/1] arm-bsp:ffa-debugfs: update git SHA for v2.1.0
Date: Tue,  6 Sep 2022 16:03:18 +0100
Message-Id: <20220906150319.1127572-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Sep 2022 15:03:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3738

From: Vishnu Banavath <vishnu.banavath@arm.com>

git sha on
https://git.gitlab.arm.com/linux-arm/linux-trusted-services/-/tree/v2.1.0
has been changed recently for v2.1.0 tag. This change is to update
ffa-debugfs-mod_2.1.0.bb to fetch correct git SHA

Vishnu Banavath (1):
  arm-bsp:ffa-debugfs: update git SHA for v2.1.0

 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.25.1


