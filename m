Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAFFC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:56:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.6826.1634806569843072542
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 01:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Yi4iEJQy;
 spf=pass (domain: burtonini.com, ip: 209.85.128.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f54.google.com with SMTP id
 y16-20020a05600c17d000b0030db7a51ee2so6814094wmo.0
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=5/cv/t+/x1TsWA9HC6nOCQwv52Vo+uUkmhJAOBiifGQ=;
        b=Yi4iEJQy4tsP45O8DNXa/7+AbkgcW8u8ALx+cdVLuY2pqqjLoMEdVhfQ+0XENGm9Yp
         H+DH6uRB+g7KvuRrVXUpTBL5k69QqiOidj2Ga3WY268RdyMJu3TmQ9RUGRJTxVb/x5zq
         nq4OheZUdG3BDYlon5jTSr9yuc7WmdpqN9d46oCJbznqFrYmq8eLXwWUSsq0cUWnZPlb
         HXKqMXgRWb2QAxD0vEFOj0yAkjQR8iOCOsv4JoJX4jCttrcrXo3STbyuucv2lRe4LECL
         8D39mnquIkk84gaDhXNxRpBQUthLj3qjTm45vBsV+3No2H8my3F/AfEOXADzaV3BZrqp
         HoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5/cv/t+/x1TsWA9HC6nOCQwv52Vo+uUkmhJAOBiifGQ=;
        b=eY1dqQULlbWVj5Fj8Q3RA40VvoZ5DYHT1uHGj9lA6kPLU0Cvf8ZNpPdKayFeO3vh+p
         5MgFF4dyv8+t0bNxHg6w3TwV1M3qNEZwn2ZVTJrxDIHm/piReJTUwCAErgCu6YUDl/h/
         NY/qnJLT+FtU2x4hSR5/E2smkfnpx30KroDx9lI4YzkEga9nyu1leYgJDOETy5D9e04h
         5vUSbvsIM96DhKjGrwiXdz0ECpJT13lreTE69SoTfwqSwnu0I1+q9uKp2WCJ44OIcSB6
         aPYTRECelYECDq1M2L9cUDkqaVx6rQPpJJNjgyiG0VsbcUB7ziiQFv/pKgWeQA30nABt
         QfcA==
X-Gm-Message-State: AOAM530yr3Dq07h03WLcb3fOF3oGQCLDLefGG01UA2GiDM0dEw7VV5JN
	U/fVc5sbXvH4go46VuGdQhLo/gL4qwwM/Otl1/OnSZ6NvbRVNg==
X-Google-Smtp-Source: 
 ABdhPJxWVVBFo0S4Wff9QF49lqoIto14DGKYjviHmtb+0eJczCCaFU+gYh1nmyiqHwzeM9ou812P8VDB9dYsixwtmvE=
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr1856132wmb.69.1634806567879;
 Thu, 21 Oct 2021 01:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211020172201.443130-1-ross.burton@arm.com>
In-Reply-To: <20211020172201.443130-1-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 21 Oct 2021 09:55:57 +0100
Message-ID: 
 <CAAnfSTuWbj-jyi7n3kZ0aiFSXUGqeyz13M_FtZW+YG2SR6wCNw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] runfvp: Ensure new process group is in the
 foreground
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Oct 2021 08:56:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2290

Breaks in CI, v2 incoming shortly.

Ross

On Wed, 20 Oct 2021 at 18:22, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> When a new process group is created, it is launched in the background
> and any attempt to access the session terminal triggers a SIGTTIN (for
> stdin) or SIGTTOU (for stdout) signal. These are ignored in an
> interactive shell, but the default signal behavior in a new job is to
> send a SIGTSTP to the whole process group. This causes runfvp to hang
> when executed via a subprocess when stdin is accessed.
>
> After creating a new process group, use tcsetpgrp to make the new group
> the foreground process for the terminal associated with stdin/stdout.
>
> The documentation for tcsetgrp states that tcsetpgrp itself raises a
> SIGTTOU signal, so set this signal to SIG_IGN.
>
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: I349a825df7fcb8a3cedb81762b901c6f50fa53b5
> ---
>  scripts/runfvp | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/runfvp b/scripts/runfvp
> index 97836726..9188a3a6 100755
> --- a/scripts/runfvp
> +++ b/scripts/runfvp
> @@ -4,6 +4,7 @@ import asyncio
>  import json
>  import os
>  import re
> +import signal
>  import sys
>  import subprocess
>  import pathlib
> @@ -220,6 +221,9 @@ if __name__ == "__main__":
>          # Set the process group so that it's possible to kill runfvp and
>          # everything it spawns easily.
>          os.setpgid(0, 0)
> +        signal.signal(signal.SIGTTOU, signal.SIG_IGN)
> +        os.tcsetpgrp(sys.stdin.fileno(), os.getpgrp())
>          runfvp(sys.argv[1:])
> +
>      except KeyboardInterrupt:
>          pass
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2289): https://lists.yoctoproject.org/g/meta-arm/message/2289
> Mute This Topic: https://lists.yoctoproject.org/mt/86470663/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

