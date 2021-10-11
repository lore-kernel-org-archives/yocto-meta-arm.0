Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7ADC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 19:01:49 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.3006.1633978906907028659
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Oct 2021 12:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4zoa5cpS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f176.google.com with SMTP id w10so19161182ilc.13
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Oct 2021 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YpueiFmC73KK46tz2E+6/V7AL9ilXRF5XpPYZHzSBv0=;
        b=4zoa5cpSnTyf0X1ccGkPtZYWwgJEy9SCwVzFfjQfWw9IozWR14Hzr1o3o+ll1s2yNc
         L5PYfInCp4VIzBt2tyA9TK9pFlrnvho8w4v7QqB00zoTeIXKaA/bbFj5l2lXScGa1KO9
         tzUbCrT41BufPguMIEajCE4+bT7wCLIom4XX3QV/oqXE/43MNLvCWEAktAALpOZGn09H
         eA8bFuV7Da3tXQXzq4eDBiXpHDFcX/l3Xji9V/P6oJkhrMOySafnm0hXAjnzcnLZFW34
         55VKfCBl/QcolKu0S0oELfb0pz7omX3CoPzFXmPVkNZyEXNEMc+0ZLAgc1SHxFzfB8TL
         Ck0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YpueiFmC73KK46tz2E+6/V7AL9ilXRF5XpPYZHzSBv0=;
        b=yLqQhjDMN/GMEKhRrod1iF9PjUY01D4EPif4fWcsiFPkSZ4/FkfNNOyS8CBcsGPNwj
         fYUCQCGKTyIkup/i91n8nCSzRCvfPpXy/TPSo3+s/I/+jNKls4zGhUkYW7tKq7V79Tib
         h1s0iVRnNG29pzRLWzqT6FGgOEKg8Vm843BpXqphpVmFanvvo9ygHrq0ntAo9eDamhlr
         pVxp4g8JCnDYmTIckIW4OdlcrsB9Tx/7eBtjV0Yzp3QYR57vNd9XUZsx3HTwvQiq8XsW
         H+pVHfymiRWgQO+zx6y6NnI+S5cmlhBt6/Y5crfhe1/95VWxX+Ga3o69tCjTr05VlLWb
         r29A==
X-Gm-Message-State: AOAM532My80m19Kcr7iuIB1rECyof/l5FH+v4Z7UnjwXnPy4qH7TPC7x
	TI1ywTLk8OwoJKtqNM/Ekqdyhla9pY/AmNY2fGv3JA==
X-Google-Smtp-Source: 
 ABdhPJybXGzbb4qc1Txg/xjWuM1CF9NW92lg/zdx7iltHDxCKP2Az5DkJNbdjH9EP4k1UudrzT/oRF1Zw6k0g9gEHtA=
X-Received: by 2002:a05:6e02:1909:: with SMTP id
 w9mr21913823ilu.34.1633978906225;
 Mon, 11 Oct 2021 12:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211009200309.4731-1-raj.khem@gmail.com>
In-Reply-To: <20211009200309.4731-1-raj.khem@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 11 Oct 2021 15:01:35 -0400
Message-ID: 
 <CAPoiz9ynD_QqA4jB=GQZKk0d7H8jNOoiHjdUwjiyzj1c18NN7A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2] gn: Disable for riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Oct 2021 19:01:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2266

On Sat, Oct 9, 2021 at 4:03 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Architecture not supported yet

Pulled into master.  Thanks Khem!

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Use a regexp instead of override
>
>  meta-arm/recipes-devtools/gn/gn_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
> index 5600222..9b3906c 100644
> --- a/meta-arm/recipes-devtools/gn/gn_git.bb
> +++ b/meta-arm/recipes-devtools/gn/gn_git.bb
> @@ -45,3 +45,5 @@ do_install() {
>  }
>
>  BBCLASSEXTEND = "native"
> +
> +COMPATIBLE_HOST = "^(?!riscv32).*"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2265): https://lists.yoctoproject.org/g/meta-arm/message/2265
> Mute This Topic: https://lists.yoctoproject.org/mt/86201640/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

