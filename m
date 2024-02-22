Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91BEC5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:46:26 +0000 (UTC)
Subject: Suggestion about keeping the recipes of LTS releases
To: meta-arm@lists.yoctoproject.org
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Linux Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Feb 2024 02:46:17 -0800
Message-ID: <pQS5.1708598777054968832.zupm@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="jCkxsUb3nCvjHDypqEJD"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Feb 2024 10:46:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5395

--jCkxsUb3nCvjHDypqEJD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

We suggest keeping the recipes of the last LTS releases on meta-arm master.

This applies to recipes maintained in meta-arm such as: TF-A, TF-M, Optee O=
S, Trusted Services, ...

This approach provides the following advantages:

- Reduce the maintenance efforts for platforms who prefer to stick with LTS=
 releases
- Increase the stability of the legacy platforms which use LTS

Cheers
Emek, Abdellatif

--jCkxsUb3nCvjHDypqEJD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi folks,</div>
<div>&nbsp;</div>
<div>We suggest keeping the recipes of the last LTS releases on meta-arm ma=
ster.</div>
<div>&nbsp;</div>
<div>This applies to recipes maintained in meta-arm such as: TF-A, TF-M, Op=
tee OS, Trusted Services, ...</div>
<div>&nbsp;</div>
<div>This approach provides the following advantages:</div>
<div>&nbsp;</div>
<div>- Reduce the maintenance efforts for platforms who prefer to stick wit=
h LTS releases</div>
<div>- Increase the stability of the legacy platforms which use LTS</div>
<div>&nbsp;</div>
<div>Cheers</div>
<div>Emek, Abdellatif</div>

--jCkxsUb3nCvjHDypqEJD--

