Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1934AC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 11:12:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9546.1648465968860250676
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 04:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=kVlYWiRC;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id m30so19870056wrb.1
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 04:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=9f8KmGb0EUY01WcfnMpIocdjR5Kvnv+/RyqkJEZAtR4=;
        b=kVlYWiRCVxFpoFzyCFUAofqu7tYcALdbckDfKozX9j8KvdNQN7uzve52Mu3wesYz0L
         6eWMyyCjaKWd6TOjXZ+PbnzydMsQ97GmPbuS9KAK733hieWLdEd67i6ndXBmx0hjVGMn
         SjtEn0CiHb6wOYPsBolPwwRLoeMpelSAHN7YSrGjpYOPNtouufRo5V9bFUNWeHILe2mt
         fI6KWj+Fx08MNi1vx2C+3B+hFSTlUfVFN6wynqGnWpQRt82Hfl4ViO/WCG5etwu8TzGW
         ZOwgrITE86u/gmpjAo/iBUxJwtDez6lUKWxMTNt344qmeUNhwzrr9pIZjAMWG76ouNxT
         qejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=9f8KmGb0EUY01WcfnMpIocdjR5Kvnv+/RyqkJEZAtR4=;
        b=E/tMJeXuVHhTEg5ZljLxn2KfMZJNWoWjm7HLH7oeo7i/2GcLiwUV+EO+gvetbMY84Z
         dIRqdMcvDoxCGuolDVg3G8dGaT8XKGTH7xY9AtpQzzRPS5SkQxwYTD9cBtV054Lzn1Fs
         IW22L0eevQBrUzXCjprWUn0QHaWFMqTDAxMBX8sDfNRWsPGbbWIZn7pt0GZQU2fWKpOA
         xoYIbVj0pc63Pl9ps36XN/LoiTRDHasO2+xmJGW2tpx9Zs1Efx7QaoHynwnnvOTd6KdI
         oP0av6qkv47h+OYG+DfH0AcqchYlOuqvFVsjZjA8mn99BfvCTjJRHpqmM6wKif6KaF2f
         ZIzA==
X-Gm-Message-State: AOAM533wQvseJXg9gVfXUmZH6YGuGJt8oElHHycAnO7naXMMhFc90zBb
	rf9aG4yK2rURj0Vs+UIP7D3fHB4l0Ju3LCc59jkbApE4Xa3o/g==
X-Google-Smtp-Source: 
 ABdhPJwzTNFk2VX/fXu066CQao8ePxf/pynVWKuiyDy9/s+U0rBn3Notw9J9MSKj3NhKj6ODDxsUKY6CQGezmGQtTAk=
X-Received: by 2002:a5d:47a8:0:b0:204:72:7051 with SMTP id
 8-20020a5d47a8000000b0020400727051mr23198513wrb.451.1648465966830;
 Mon, 28 Mar 2022 04:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220325134853.3068169-1-ross.burton@arm.com>
 <20220325134853.3068169-6-ross.burton@arm.com>
In-Reply-To: <20220325134853.3068169-6-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 28 Mar 2022 12:12:35 +0100
Message-ID: 
 <CAAnfSTsVTNA6kpc7SOWOt7Wyua05DVYZZJgpp-PHtCjssKvh+Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 6/7] CI: fix random testimage failures
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Mar 2022 11:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3213

This commit is now in poky, so shouldn't be pulled in.

Ross

On Fri, 25 Mar 2022 at 13:49, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
> Backport a patch from Poky to fix random failures in testimage where
> sys.path contains meta-arm twice, causing testimage to complain that
> there are duplicate class names.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...text-remove-duplicate-sys.path-entri.patch | 38 +++++++++++++++++++
>  ci/base.yml                                   |  4 ++
>  2 files changed, 42 insertions(+)
>  create mode 100644 ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-entri.patch
>
> diff --git a/ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-entri.patch b/ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-entri.patch
> new file mode 100644
> index 00000000..6fcefd25
> --- /dev/null
> +++ b/ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-entri.patch
> @@ -0,0 +1,38 @@
> +From 366316dca4ad6a0485b68fbf3271651d90395573 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Thu, 24 Mar 2022 18:11:27 +0000
> +Subject: [PATCH] oeqa/runtime/context: remove duplicate sys.path entries when
> + looking for modules
> +
> +sys.path can contain duplicate entries for each layer, which means that
> +the search in add_controller_list() will find the same name twice and
> +abort.
> +
> +As duplicate directories should be harmless, remove any duplicates before
> +iterating through the entries.
> +
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + meta/lib/oeqa/runtime/context.py | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
> +index d707ab263a8..8092dd0baee 100644
> +--- a/meta/lib/oeqa/runtime/context.py
> ++++ b/meta/lib/oeqa/runtime/context.py
> +@@ -153,7 +153,11 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
> +                 else:
> +                     raise RuntimeError("Duplicate controller module found for %s. Layers should create unique controller module names" % module)
> +
> +-        for p in sys.path:
> ++        # sys.path can contain duplicate paths, but because of the login in
> ++        # add_controller_list this doesn't work and causes testimage to abort.
> ++        # Remove duplicates using an intermediate dictionary to ensure this
> ++        # doesn't happen.
> ++        for p in list(dict.fromkeys(sys.path)):
> +             controllerpath = os.path.join(p, 'oeqa', 'controllers')
> +             if os.path.exists(controllerpath):
> +                 add_controller_list(controllerpath)
> +--
> +2.25.1
> +
> diff --git a/ci/base.yml b/ci/base.yml
> index 9a59de79..d19901dd 100644
> --- a/ci/base.yml
> +++ b/ci/base.yml
> @@ -19,6 +19,10 @@ repos:
>      layers:
>        meta:
>        meta-poky:
> +    patches:
> +      oeqa-duplicates:
> +        repo: meta-arm
> +        path: ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-entri.patch
>
>  env:
>    BB_LOGCONFIG: ""
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3210): https://lists.yoctoproject.org/g/meta-arm/message/3210
> Mute This Topic: https://lists.yoctoproject.org/mt/90022499/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

