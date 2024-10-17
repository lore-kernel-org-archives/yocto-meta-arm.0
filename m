Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140C2D374A4
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 14:48:36 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] trusted-service: remove optee udev and group settings
To: meta-arm@lists.yoctoproject.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Lewisham, England, GB (84.71.120.203)
X-Originating-Platform: Mac Firefox 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 17 Oct 2024 07:48:27 -0700
References: <ZxDwXeOdfwuCsI_p@nuoska>
In-Reply-To: <ZxDwXeOdfwuCsI_p@nuoska>
Message-ID: <18350.1729176507648104860@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="UkLFYx4WqnOX82YNXZ2K"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 14:48:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6213

--UkLFYx4WqnOX82YNXZ2K
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 04:09 AM, Mikko Rapeli wrote:

>=20
> I'm still not sure of the right direction. Which recipes and layers have
> userspace
> SW which needs to access /dev/tee* or /dev/teepriv* devices nodes without
> root
> rights in userspace? Where is a test for these recipes or functionality?

Parsec is the example you're looking for. And parsec oeqa tests would test =
TS provider if included

Anton

--UkLFYx4WqnOX82YNXZ2K
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Oct 17, 2024 at 04:09 AM, Mikko Rapeli wrote:</div>
<div>
<blockquote>I'm still not sure of the right direction. Which recipes and la=
yers have userspace<br />SW which needs to access /dev/tee* or /dev/teepriv=
* devices nodes without root<br />rights in userspace? Where is a test for =
these recipes or functionality?</blockquote>
</div>
<div>Parsec is the example you're looking for. And parsec oeqa tests would =
test TS provider if included<br /><br />Anton</div>

--UkLFYx4WqnOX82YNXZ2K--

