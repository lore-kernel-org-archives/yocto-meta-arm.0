Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.4151.1596098236445674844
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 01:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=jQLGYRa2;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id k13so14532088lfo.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jul 2020 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=K635Uxl9SrdtU7uTXBt8r7EIVpp/TUCuxdkKuMxVOoM=;
        b=jQLGYRa2lEcCD46xtFGzZsybntQvO7QYAdGq9jY17V/ZpRjDCVZdX8FVP1aX6dVhTb
         5RiVXdvjTjn3vMDf84tA6myY8QAhgt+S5DWwHOJ10B+rDmUp5DCIFLMwC8SDy+2yW/Y3
         foPR+UiYc7lUDWs5yBK6RoP5nKkqg5IW3kY32akdu7qoqZujjJBulMXpkemudivYMRNR
         ps0w+8sGxIdaN5m45eJ0ckDKebr3CGmAkzlhD9JE1nLwKPPw1uHPo5TIXEwVAMR2MrVn
         +lZknK5Lj8liZqgKDo8fYtN8bfGBI/wNFhdLJdEpUCd9ZE9ttebEfyZtnLpov+g9je8H
         YKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=K635Uxl9SrdtU7uTXBt8r7EIVpp/TUCuxdkKuMxVOoM=;
        b=itFballE5DDZq0q9Gj6NBFKkiMsxeIkkjTFDYUAH7/xsvjxgQxteFc5TNB8LHCMzz1
         Kw6WqoUu7jXYXXahvUnmTeHxUa6SmeqGo05O16mSQklIXJJ21Aa1yCvLjk5+xqOeVJSk
         p/72Xq13l0iHGYCOfBRIYqYxYSCbW5hiNeIPIgDIcgec0oVexxTA6nJAq0TBzz8vpKd8
         n3zmMaJZcFYxn0Emf8zquCyutaOUVL+4XQwxVVFdMBUD6mhQRsHTnyGmLU2H3raQDj6K
         LQW4Cp5TLU5ieKEG+JI04jAW5WB6DW4sQSgEg1tk2FPgOPAvNWSOeV+/1EZJ6ELyAC/h
         Ad3g==
X-Gm-Message-State: AOAM532/+6j5TrF2I66Pe8/I7mA0yRzfn+fhkIqeY4EhApPP2L1EZJ8z
	5gzUBal4k+6XaHG3QA5lr2xi84P8bF+SkNWXHP5JARFCgYQ=
X-Google-Smtp-Source: ABdhPJxK3ClUA7rrKXnuFyYeldn0n9SvkDdoiv5pzo/Idri9mkAa1W1RBRFTgSVbgrgwiwmzgQkkIFhnQAUAp9KScZA=
X-Received: by 2002:a19:230e:: with SMTP id j14mr1131140lfj.19.1596098234254;
 Thu, 30 Jul 2020 01:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200729101145.1794231-1-ross@burtonini.com> <20200729101145.1794231-4-ross@burtonini.com>
In-Reply-To: <20200729101145.1794231-4-ross@burtonini.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 30 Jul 2020 09:37:03 +0100
Message-ID: <CAAnfSTuc+XodKwzKhitUZZYaQ62rKKYPi=ra7wc325GRcdhrNQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm/scp-firmware: use gitsm fetcher
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jul 2020 at 11:11, Ross Burton <ross@burtonini.com> wrote:
> -
> -# SCP
>  LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731"
> -# CMSIS
> -LIC_FILES_CHKSUM += "file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"

I got a bit keen removing things here, v2 incoming.

Ross
