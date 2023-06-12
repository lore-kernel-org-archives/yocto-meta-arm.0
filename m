Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A88FC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 05:32:11 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.52364.1686547924208563621
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 11 Jun 2023 22:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=TWksrpAa;
 spf=pass (domain: linaro.org, ip: 209.85.222.52, mailfrom: sumit.garg@linaro.org)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-783f88ce557so1548985241.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 11 Jun 2023 22:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686547923; x=1689139923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnjgZT57WfHSSm0GJTnvfTmwHjzGuNlZexhyUFgpSzM=;
        b=TWksrpAa/sK3JqX5W9ZOkQnwXNA+88xnAA1Wi+sXdpvkGVjSpHBLE+r66qvrtuNABV
         RGeDZi1o0dJDCd2jhjvK8My+VhV6l0XDR7GxmnzNvSrtzON+w7D4C/hTaB22Y1ugZT5Z
         c4r5WCmW58JlRsdDUE1Z4W+Jy1/MkNqAFgatP0/F2lyvXPQ/6+xA9mzZDSwPUiN1A1u/
         BIInv8PeLl5jStF9CWG8eYJmf8QNqtLLMHugNlkUbSvb/pkJj8FmxK2Equh3hr0SzgqI
         UCRchD/CQU2FST00XgPzgx26TyTL7y985gb0TdX5+L7XiSzo5oN/saDCkpIik4jsEU0v
         as1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686547923; x=1689139923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnjgZT57WfHSSm0GJTnvfTmwHjzGuNlZexhyUFgpSzM=;
        b=Z7xiw8DwzmK5oaa/+clsAAEad8E6u0d6W41O6MmUfy+LNQhWWM7aVRmhfIYhAUr2LA
         lEe3Kn5GxB/mzZ4B4ls+pmEHBD9eP2XUmxnhl4YJOQU8S4Tnz9I4JgURXygzjShkRH4y
         PUQADmoSwB4cHOKnTLkOBlCGbrysZbEsz6emCJ5JYlcfOQbrKs32jnHvWyt5ZpPa1qgQ
         JM95CY98phZkNBVf00cUtXdBKNGTpsMSPAVpJhCzCUBNVcKsiJGR0w5T4M8w7hndPiC7
         SJCbsxDstn/ufbTR2KZJZi8eWyOdm63UhYdd4ptJWA62VG8YVDw6YmRbbUAM1U75VEm0
         aq9A==
X-Gm-Message-State: AC+VfDx/gPtMMYZOPx/fG71gq5jhbmxPGRwecpE+5X/qJnZa32ybEMuM
	kxuvKo/O6jojho0FT7gLeS6IrfRTiMn0m26bHT9znaTCSmg/9imV
X-Google-Smtp-Source: ACHHUZ4GyADZCAJEEt3qRgiP4V5XKHs0tzaTA2f0hotUbcLKdmn09Lj2b56uhx2RkreATAj6j83Vbq5QXVdnOs7Q5h0=
X-Received: by 2002:a1f:d405:0:b0:464:cd5c:b37e with SMTP id
 l5-20020a1fd405000000b00464cd5cb37emr4024935vkg.0.1686547923052; Sun, 11 Jun
 2023 22:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <9BB4164D-F0CC-4CB9-BAD0-4F3E64E7904A@arm.com>
In-Reply-To: <9BB4164D-F0CC-4CB9-BAD0-4F3E64E7904A@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 12 Jun 2023 11:01:51 +0530
Message-ID: <CAFA6WYPOto7Y0_q4M4067beTa4NaBJCPCPjGaxqFoqxFPL=WZQ@mail.gmail.com>
Subject: Re: RFC: removal of gcc-arm recipes
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Denys Dmytriyenko <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jun 2023 05:32:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4757

Hi Ross,

On Thu, 8 Jun 2023 at 20:03, Ross Burton <Ross.Burton@arm.com> wrote:
>
> First, to be clear, I am not talking about the removal of the binary tool=
chain recipes (gcc-arm-none-eabi and gcc-aarch64-none-elf) or support for e=
xternal binary toolchains (TCMODE =3D "external-arm=E2=80=9D).
>
> I=E2=80=99m talking specifically about the gcc-arm recipes in meta-arm-to=
olchain that take the source release of the Arm GNU Toolchain, apply the be=
st-effort rebase of the oe-core patches on top of that, and then build it a=
s GCC.  This recipe is time-consuming to maintain (the patches need to be m=
aintained and synced with oe-core manually), and when the oe-core GCC and t=
he Arm GNU Toolchain are different versions things tend to break.
>
> For example: oe-core master now has GCC 13.1 so oe-core uses the new -fca=
non-prefix-map option, but gcc-arm is 12.2 which doesn=E2=80=99t know this =
option.  Set GCCVERSION to arm-12.2 and the build fails because it passes a=
 GCC 13-specific option to GCC 12, and there=E2=80=99s no neat way to remov=
e that option automatically.
>
> This doesn=E2=80=99t affect the external binary toolchain support as we c=
an manipulate DEBUG_PREFIX_MAP in the toolchain file as needed.
>
> My hypothesis is that nobody is actually using the gcc-arm recipes.  If y=
ou just want GCC then you=E2=80=99ll be better off using the recipes in oe-=
core already, they=E2=80=99re updated more regularly.  If you want GCC with=
 Arm=E2=80=99s special sauce/source then you=E2=80=99re trusting that our r=
ebuild of it -- with almost 30 patches on top -- is actually effectively th=
e same as the binary release that Arm makes.  In that case you=E2=80=99re p=
robably better off using the binary release: you can be sure it does what i=
t claims, and if it goes wrong there=E2=80=99s actually a support channel.

Agree. Although the upstream toolchain is the latest and greatest but
just wanted to mention a binary toolchain feature. We do support
multiple versions of binary toolchain in case someone has a particular
requirement to stick with an older version of binary toolchain
release.

>
> So, in the spirit of keeping the things that people use and removing the =
things that people don=E2=80=99t, I=E2=80=99m thinking we should remove gcc=
-arm.  Does anyone have any strong opinions on this?
>

I would be in favor of dropping gcc-arm too. The last time I checked
diff among gcc-arm and upstream was release branch 12. The diff was
quite small and that was related to a relatively newer feature which
should be floating upstream for review. So it's better for everyone to
be on common ground especially when it comes to using upstream source
toolchain for OE builds.

-Sumit

> Thanks,
> Ross

