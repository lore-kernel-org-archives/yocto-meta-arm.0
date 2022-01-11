Return-Path: <rfairfax@microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B70C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 20:57:34 +0000 (UTC)
Subject: Re: [PATCH v2] arm/optee-os: Fix build race condition when building
 fTPM
To: meta-arm@lists.yoctoproject.org
From: "Ryan Fairfax" <rfairfax@microsoft.com>
X-Originating-Location: Redmond, Washington, US (71.227.177.100)
X-Originating-Platform: Windows Chrome 97
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 11 Jan 2022 12:57:34 -0800
References: <20220111203535.GD26229@denix.org>
In-Reply-To: <20220111203535.GD26229@denix.org>
Message-ID: <28427.1641934654274483840@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="G7zOLYpQAmBiPYSeW8Ro"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 20:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2823

--G7zOLYpQAmBiPYSeW8Ro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks - I've got a solution I think will work with git send-email based on=
 some feedback from co-workers.=C2=A0 I'll get that tested and then resend =
the patch when I see everything working on my end.=C2=A0 Apologies for the =
noise.

--G7zOLYpQAmBiPYSeW8Ro
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks - I've got a solution I think will work with git send-email based on=
 some feedback from co-workers.&nbsp; I'll get that tested and then resend =
the patch when I see everything working on my end.&nbsp; Apologies for the =
noise.

--G7zOLYpQAmBiPYSeW8Ro--

