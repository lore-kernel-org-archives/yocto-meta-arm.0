Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3ECC25B10
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 09:52:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9578.1714643525708374115
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 02:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAADC2F4;
	Thu,  2 May 2024 02:52:30 -0700 (PDT)
Received: from e125751.cambridge.arm.com (e125751.cambridge.arm.com [10.1.195.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE78E3F793;
	Thu,  2 May 2024 02:52:04 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] kas: corstone1000: include TS and PSA dependency for firmware image build
Date: Thu,  2 May 2024 10:51:57 +0100
Message-Id: <20240502095158.2793406-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 09:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5684

From: Emekcan Aras <emekcan.aras@arm.com>

Includes TS and PSA dependency for firmware image build

Emekcan Aras (1):
  kas: corstone1000: include TS and PSA dependency for firmware image
    build

 kas/corstone1000-image-configuration.yml | 1 +
 1 file changed, 1 insertion(+)

--=20
2.25.1


