Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18809C7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:10:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.27352.1677859813897600296
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Mar 2023 08:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74277143D;
	Fri,  3 Mar 2023 08:10:56 -0800 (PST)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.38.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64F5A3F67D;
	Fri,  3 Mar 2023 08:10:12 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/1] CI: append classes to INHERIT in the common fvp.yml
Date: Fri,  3 Mar 2023 16:09:47 +0000
Message-Id: <20230303160948.782860-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Mar 2023 16:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4468

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Making sure INHERIT in fvp.yml uses a +=3D rather than =3D

Abdellatif El Khlifi (1):
  CI: append classes to INHERIT in the common fvp.yml

 ci/fvp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.25.1


