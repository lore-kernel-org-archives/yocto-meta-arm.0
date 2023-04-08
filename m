Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F241C7619A
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 08:13:33 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.6924.1680941606113666079
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 08 Apr 2023 01:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tz5tOiIu;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id g12so532937qtj.12
        for <meta-arm@lists.yoctoproject.org>; Sat, 08 Apr 2023 01:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680941605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9yaD1NaPskWGdXnsvdWvU5gd99yhGocYSl4xkPxqWM=;
        b=Tz5tOiIuIQiRVhZR2u6fUrK//bU+I5yvAZ1WZOsO6RgRq1r2eeIRYAyNy7k1UKsLxi
         dZmt4wrwDW8fGsrohbIfpJyKGYHVvWkA2Qh8YwES4FtpexHG+VdVKwkJYXnzzYM5QikR
         09Nn4rho5SH3jbR04ym8c/Z3wgvutvvrO7M5j/S12MmSyvkisKIw6bCqbY1TSujGp8gW
         8oRIWyE0gnP8CwfF6LgDo+nnnrCSUqHdMFDooupefXiCpf6fdmHsNkL3LtzU5ZLHarXI
         NLWvSS2ZLbzDXtizJe/agrLgQxXlZpGz6AktQ4g2nJdKE9FduyKHaBaxmkRm3pXiVgnk
         30Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680941605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9yaD1NaPskWGdXnsvdWvU5gd99yhGocYSl4xkPxqWM=;
        b=0XSSKzH3wndbR7HVM/JaNGMYYXQRTFlqQ+bm6JEr6LWsqPpF1N8otDH8ILw7i8D5iN
         ocvMSdtC1VHNW0JJ0879PGK8qL4dCexD3RPjHIYMXsZ3ZkO42Hm9a4v+HD/2shVDXMcO
         Mcbtnpc0ii2mo/9yFtsWJF5m7+TpbFxlj+n6Ngd4LUOLErbjNq8SPqAHX2cS0VyjLMqV
         X3zr+ltLxVVThLTi31lAZAb3w7maVQYCWzHFyuVzPNYsEz3iKJ5zW0MAP8/dy25hrb/I
         RZZqDYVwb/S97Udks3J8WHCsyzSCwC5og3uJIXxewFyx6gCltm0XTUqRBJ7/nD2diGB6
         H71A==
X-Gm-Message-State: AAQBX9fum+yomBDL9EFzjMoLrcalG0hDMXGcznnqqe/VCE2AljnxSBHx
	QntjSLyYq/8PBZDauiQcm8pjp8+l8VPWo/zI7dM=
X-Google-Smtp-Source: AKy350bIS7lRUbMCAdseqju69H8s/BWZAkMOqxsiIklOOo1tLe79lRcbIlPjWcPsjZjOo9XYMwQgsqv5fVhRos8L9dQ=
X-Received: by 2002:ac8:5b95:0:b0:3e3:8172:ff23 with SMTP id
 a21-20020ac85b95000000b003e38172ff23mr1526975qta.13.1680941605116; Sat, 08
 Apr 2023 01:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230406152908.224075-1-peron.clem@gmail.com> <1753621D8383E1DE.3977@lists.yoctoproject.org>
In-Reply-To: <1753621D8383E1DE.3977@lists.yoctoproject.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 8 Apr 2023 10:13:14 +0200
Message-ID: <CAJiuCceqeBwQZxAm5QO2zUDLiqg6-vhdRnit=YnR6Du2QmCSVw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2 2/2] scripts/runfvp: Fix KeyError exception
 when there is no FVP_CONSOLE provided
To: peron.clem@gmail.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 08 Apr 2023 08:13:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4567

Hi,

On Thu, 6 Apr 2023 at 17:29, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject=
.org
<peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> We access the dictionnary element that doesn't exist.
>
> Use the get() method instead that will default the element to None if it
> doesn't exist.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  scripts/runfvp | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runfvp b/scripts/runfvp
> index 939352b5..bfd60d71 100755
> --- a/scripts/runfvp
> +++ b/scripts/runfvp
> @@ -55,8 +55,9 @@ def start_fvp(args, config, extra_args):
>          fvp.start(config, extra_args, args.terminals)
>
>          if args.console:
> -            expected_terminal =3D config["consoles"]["default"]
> -            if not expected_terminal:
> +            fvp.add_line_callback(lambda line: logger.debug(f"FVP output=
: {line}"))

Not sure where this line comes from, surely badly introduced during
the rebase :/

I have sent a v3

Clement

> +            expected_terminal =3D config["consoles"].get("default")
> +            if expected_terminal is None:
>                  logger.error("--console used but FVP_CONSOLE not set in =
machine configuration")
>                  return 1
>              port_stdout, log_stdout =3D itertools.tee(fvp.stdout, 2)
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4561): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4561
> Mute This Topic: https://lists.yoctoproject.org/mt/98107299/4240582
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peron.clem@=
gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

