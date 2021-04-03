Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.28414.1617440642263896694
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 03 Apr 2021 02:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=JjyXhR0c;
 spf=pass (domain: burtonini.com, ip: 209.85.128.47, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f47.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so3316680wmj.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 03 Apr 2021 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iksbzKjUS0ZHXj8TaP6eodLv2gzO+KTm7KY6lBIO1BE=;
        b=JjyXhR0cx+IMhApzkaZEYKQIIsg4SWNDcTsQYhDpCy5fkDAgjfVVHb6JU+ZDNJasMI
         5zH1yzJzXxtjk5IV1rKC9K9NeJTiSAcumK5PMZ+PcxJ0EDXsRwjXIV7ONhqxlY3U8Ieu
         SnlrCqF2N3vfiHtSA0M37BUgblV+9i2tPkuR2RPhahvVvjV9VK2KXwKjJ9dpCQP1CiOW
         bctakTAH2ZH9GH0f1n8Lc0J1ik/CL0oKSmyQxVadygD6pTD5BZfWOaKnsxhTYuxb0Qii
         DYQEOom1287uYfqpu2fReWo03zZZ1eV3/P8fB6VORhwAMZl8hrZElqJChncDjblapeAX
         tviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iksbzKjUS0ZHXj8TaP6eodLv2gzO+KTm7KY6lBIO1BE=;
        b=DxrXmaf+ZAi9qiXXM0A7/wi47vpykFtz8IWXhSFfJCr1HJIDpyL8W2a//47R5uUfnq
         nlR44i5wVp0XriJ0h9Cs+X7JtPcQy2vWMDISqGE4lsS3sf6eVzhbMCdVfvpcoldS5yxr
         vhpZfKoJ+eIoZ4IRAzpUANRYwc+LX3L4FJwE+G2qX0CjRVclk0rib4Y2XQ6Y0PaHPIoK
         Y0jOrKYbkK8QX6+oSGd89H/FoIDtBLfGxDVYUwCKF2ahjOcLMQLwMmqFELVmL1L/JaiZ
         e13a0yonffmdgraa2ej3YmWqb5Qgx9A6wSI/UpOHf66+/Su5M7aGgU4Nz6GuCgXNKpZO
         xp9g==
X-Gm-Message-State: AOAM53358nCj8kayX/+bliSbVkd+08ZljIxjZQ6iHq5xp8g2ZY+3P8DO
	7sxqrYG35WXtKYCpdSpB8Rn04T5TR9q0DdgnoNQgaA==
X-Google-Smtp-Source: ABdhPJzdfFjhtCSlpISKy0xiZ6vewewxxSzXobkcZ1z2woQHwDIm8fiRZPKQzUcMjCBii8YE2x5RPi6mkPeD2r1sgko=
X-Received: by 2002:a1c:6855:: with SMTP id d82mr16725531wmc.169.1617440640816;
 Sat, 03 Apr 2021 02:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soZtavUBVCiGjFdOWU=LChYs-yUX81LTr1Jqcj7CxHUtg@mail.gmail.com>
In-Reply-To: <CAMKF1soZtavUBVCiGjFdOWU=LChYs-yUX81LTr1Jqcj7CxHUtg@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Sat, 3 Apr 2021 09:03:49 +0000
Message-ID: <CAAnfSTuzr0Dh70AWh0NzBg4UL1aV4NDQHjZnpOjqPo99f03pvw@mail.gmail.com>
Subject: Re: [meta-arm] sbsa-acs failing to build for not qemuarm64 machines
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Yes.  Forgot to check, sorry.  The intention was that the edk2 support
would handle that but I failed to include the compatible machine.

Patches welcome, or I'll do this when I'm back at work.

Ross

On Sat, 3 Apr 2021 at 01:19, Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/575311/
> https://errors.yoctoproject.org/Errors/Details/575302/
>
> is this recipe aarch64 only? if so then it should appropriate
> compatible_host
>
> 
>
