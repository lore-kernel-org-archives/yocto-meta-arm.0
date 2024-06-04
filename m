Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D37C41513
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:25:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16582.1717489553873215247
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 01:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4B8E1042;
	Tue,  4 Jun 2024 01:26:17 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.71.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF353F792;
	Tue,  4 Jun 2024 01:25:52 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 0/1] Corstone1000: Make sure EULA is accepted manually
Date: Tue,  4 Jun 2024 10:25:47 +0200
Message-Id: <20240604082548.194002-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 08:25:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5783

From: Bence Balogh <bence.balogh@arm.com>

The LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA" was added to a kas file,
so the user did not have to accept it manually. This commit fixes this.

Bence Balogh (1):
  kas: corstone1000: remove Arm-FVP-EULA flag

 kas/corstone1000-fvp.yml | 1 -
 1 file changed, 1 deletion(-)

--
2.25.1


